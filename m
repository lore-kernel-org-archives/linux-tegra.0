From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Wed, 11 Dec 2019 20:54:53 +0100
Message-ID: <76d72777-b144-0679-1f4c-1136496a5f06@suse.de>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20191210132146.GF2703785@ulmo>
 <8ff73b97-cf2e-0c91-2764-05ce4c548b06@suse.de>
 <alpine.DEB.2.21.999.1912111751490.32095@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <alpine.DEB.2.21.999.1912111751490.32095-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: "kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org" <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "chunhui.dai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <chunhui.dai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yangtao Li <tiny.windzz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org" <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org" <miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, "nsekhar-l0cyMroinI0@public.gmane.org" <nsekhar-l0cyMroinI0@public.gmane.org>, "tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rfontana-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <rfontana-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-riscv-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-riscv-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Leonard Crestez <leonard.cres>
List-Id: linux-tegra@vger.kernel.org

Am 11.12.19 um 18:57 schrieb Paul Walmsley:
> On Tue, 10 Dec 2019, Andreas F=E4rber wrote:
> =

>> I have similar cases with Realtek where registers are simply not grouped
>> into convenient blocks but spread across large memory regions.
> =

> At the hardware level, registers are grouped into IP blocks, to simply =

> both design integration and address decoding.

Reality shows, not all vendors/chips always care about simplification.

Blocks do have names, but they don't always group registers of the same
kind, as Linux expects it - be it for historical backwards compatibility
reasons or because Linux/Android wasn't their main use case in the past.
Firmware developers won't care where their registers are located.

>  Not knowing which Realtek =

> device you're referring to,

Arm based RTD1195 and RTD1295/RTD1395/RTD1619/RTD1319 SoC families,
which I maintain.

> most likely it's the same situation as with =

> the IMX8M TRM, where the DT data doesn't match the underlying reality of =

> the hardware.  In those cases the best approach is usually to just fix th=
e =

> DT data.

No, you're not reading me. My DT data matches the hardware as far as I
know it. You can be really happy that you can login to get NXP manuals;
for other vendors, manuals simply don't exist and we have to deduce DT
from register names/offsets ourselves. Reality is messy!

Just please accept that hardware does not always allow for unique
contiguous memory reservations, and we therefore cannot force these
types of reservations onto everybody.

There might be an opportunity for a new helper with even longer name
that does the expected combination of actions. But is it worth it?
People seem to have stopped giving motivations for their patches in
commit message or cover letter, so it remains entirely unclear how else
one might satisfy the submitter's goals while keeping your code working.
(Also referring to unjustified style-only cleanups popping up lately.)
"to simplify code" is not much to go on, it sounds like a style cleanup
without any practical error avoidance benefits nor an API to be dropped.

Note that I did not receive any cover letter accompanying this patch,
but was CC'ed on plenty of other patches like this one that I'm not
maintainer of, leading me to assume that none was sent.

Alternatively one could do the reservations decoupled from DT inside the
driver, but again not using this suggested helper.

From what I read on other such patches, apparently some Coccinelle build
target emits warnings when it matches some pattern for potential
refactoring, which people then set out to resolve, without understanding
the code they touch or being able to actually test it. That's probably
the root cause that someone would need to tackle - whitelisting
fully-intentional usages of certain APIs to protect against unwarranted
refactorings, or otherwise making sure that people don't get inspired to
in their best intentions break other people's code. I assume kbuild bot
doesn't send out such cocci warnings to us maintainers for good reasons.

A completely fragmented DT with either dozens of reg entries for single
registers or distinct compatible strings for individual registers, to
give them their own DT nodes, is not really handy, compared to one or
two larger clk nodes that handle reg offsets under the hood, without
impacting public DT bindings (e.g., bumping reg's maxItems, clk header).

If you care about modeling this, you're welcome to participate in patch
review @ DTML/LAKML/LRSML. So far there's largely been a yawning silence
in response to my patches introducing syscon and simple-mfd as cleanups,
before things get worse as we add to the DT. Following an unreviewed clk
RFC of mine two years back, there's now been a clk patchset from Realtek
that got a load of review comments from me, waiting for a v2.

If you don't care, then please don't lecture us about how you think
other people's hardware should ideally be like. That's not helpful.

Regards,
Andreas

-- =

SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer
HRB 36809 (AG N=FCrnberg)
