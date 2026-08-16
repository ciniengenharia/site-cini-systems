# Cini Systems — site

Site estático: uma pasta por URL, `index.html` dentro. Publica direto no GitHub Pages com o `CNAME`. Sem build, sem dependência.

## Páginas prontas

```
/                          home — o cruzamento entre módulos é a peça central
/modulos/                  hub, agrupado por situação real
/modulos/nr-12/            módulo disponível — template das páginas de módulo
/servicos-de-engenharia/   contratação separada da plataforma
/orcamento/                conversão, com formulário que já qualifica
```

## Decisões que vieram do escopo

**Identidade.** Fundo azul-escuro quase preto com textura de pontos e linhas (`body` no `base.css`, três gradientes sobrepostos), dourado `#C9A227` como destaque. "Aqui as normas conversam entre si" abre a home e fecha o rodapé. Os pilares Projetos · Normas · Conformidade aparecem sob a capa e no fim de cada página.

**Sem página de preços.** Licença de uso por módulo, proposta caso a caso. Todo caminho leva a `/orcamento/`.

**O cruzamento não ficou em texto corrido.** Virou um diagrama SVG navegável na home, com três casos que vêm direto do escopo: a máquina sem seccionamento (NR-12 → NR-10 → NR-16), o CA e o ASO que vencem sozinhos (NR-6 e NR-7 → NR-10) e a consolidação no PGR (tudo → NR-1). Clicar num caso acende os nós e anima o fluxo entre eles. A pergunta "este eletricista pode trabalhar nesta máquina hoje?" fecha o bloco.

**Status honesto em toda parte.** Componente `.status` com três variantes: disponível (verde), em desenvolvimento (âmbar), no roteiro (cinza). Aparece na home, no hub, na lateral das páginas internas. O hub separa os três grupos em seções distintas — não dá para confundir NR-12 com NR-6.

**Formulário que qualifica.** `/orcamento/` já coleta perfil (indústria ou profissional), porte em trabalhadores, quantidade de máquinas, número de plantas, normas de interesse e se precisa de serviço de engenharia. Quem marca "profissional" recebe uma pergunta extra sobre tamanho da carteira. Valida antes de enviar e exige ao menos uma norma marcada — é o que define quais módulos entram na proposta.

**Sem fotografia.** As telas do produto são HTML e CSS (`.tela` no `base.css`). Custo zero e mais convincente que foto de banco de imagem.

## SEO

Cada página tem `canonical`, Open Graph, JSON-LD e trilha com `BreadcrumbList`. A home carrega `Organization` + `SoftwareApplication`; a página de NR-12 carrega `SoftwareApplication` + `FAQPage`, com as perguntas escritas em torno das palavras-chave do escopo (software NR-12, análise de risco de máquinas, cálculo de HRN, laudo NR-12).

A navegação é **inline em cada página**, não carregada por `fetch` como no site da Cini Engenharia — isso melhora o LCP e garante que o menu esteja no HTML servido.

## Pendências

**Duas páginas linkadas e não escritas**, apontadas pelo `./checar-links.sh`:
- `/modulos/nr-10/` — vale escrever cedo: "gestão de NR-10" e "prontuário NR-10" são palavras-chave do escopo, e a norma acabou de ser reescrita pela Portaria MTE 737/2026, com vigência em junho de 2027. Página de módulo em desenvolvimento pode capturar essa busca desde já.
- `/modulos/cini-electrical-3d/` — "diagrama unifilar atualizado", "estudo de curto-circuito" e "estudo de energia incidente" são buscas de alto valor e baixa concorrência.

**Placeholders a trocar:** domínio `www.cinisystems.com.br` (aparece no `CNAME`, nos `canonical`, nos Open Graph e nos JSON-LD), telefone em `/orcamento/`, e o nome do engenheiro responsável — o escopo pede credibilidade técnica com formação e atuação, e hoje o texto fala do profissional sem nomeá-lo.

**Formulário sem backend.** GitHub Pages não processa formulário. Ao enviar, ele valida e avisa. Conecte a Formspree, Basin ou Web3Forms — os campos já estão nomeados para chegar organizados no e-mail.

## Como criar uma página de módulo

```bash
cp -r modulos/nr-12 modulos/nr-10
```
Trocar `<title>`, `description`, `canonical`, `og:url`, os dois JSON-LD, a trilha, o `.status` do cabeçalho e o conteúdo. Incluir a URL no `sitemap.xml` e rodar `./checar-links.sh`.
