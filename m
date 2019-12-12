From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Thu, 12 Dec 2019 06:38:31 +0100
Message-ID: <1a415db0-9313-72c3-e02c-0f3b8e0e5da0@suse.de>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20191210132146.GF2703785@ulmo>
 <8ff73b97-cf2e-0c91-2764-05ce4c548b06@suse.de>
 <alpine.DEB.2.21.999.1912111751490.32095@utopia.booyaka.com>
 <76d72777-b144-0679-1f4c-1136496a5f06@suse.de>
 <alpine.DEB.2.21.9999.1912111411120.73923@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <alpine.DEB.2.21.9999.1912111411120.73923-uVVcHvDei0GDatTbedK6yA@public.gmane.org>
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
To: Paul Walmsley <paul.walmsley-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Cc: "kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org" <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "chunhui.dai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <chunhui.dai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yangtao Li <tiny.windzz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org" <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org" <miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, "nsekhar-l0cyMroinI0@public.gmane.org" <nsekhar-l0cyMroinI0@public.gmane.org>, "tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rfontana-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <rfontana-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-riscv-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-riscv-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Leonard Crestez <leonard.cres>
List-Id: linux-tegra@vger.kernel.org

Am 11.12.19 um 23:49 schrieb Paul Walmsley:
> On Wed, 11 Dec 2019, Andreas F=E4rber wrote:
> =

>> Blocks do have names, but they don't always group registers of the same
>> kind, as Linux expects it
> =

> Linux does not expect that all of the registers in the same IP block are =

> of the same kind.  That's part of the reason why Linux frameworks exist.  =

> To consider clocks as the present example, you're welcome to register =

> local IP block clock control registers in the local IP block driver via =

> the clock framework.  There's no need for a separate clock driver with an =

> overlapping address range, or anything like that.

If I throw random code into drivers/mfd/ it will not get proper review.

We rely on clk drivers going into drivers/clk/, even if I could
theoretically register clks also from other parts of the code base -
which will then require complex Kconfig dependencies or #ifdef'ery, not
to mention the nightmares of collecting Acks and figuring out through
whose tree which patches go.

> =

> This is nothing new with Realtek.

As this NXP patch proves. :)

>  IP blocks that contain many different =

> kinds of registers have had Linux driver support without requiring =

> overlapping register address ranges long before Realtek ARM SoCs =

> appeared.

Hey, you're the one that's trying to pin this on Realtek, not me!
STM32 RCC is another example I know, also Allwinner, etc. My point was
precisely that this is - for good or bad - a rather common scenario that
we need to deal with.

>> Just please accept that hardware does not always allow for unique =

>> contiguous memory reservations
> =

> Hardware designs do in fact mandate unique contiguous memory reservations,
> otherwise address decoding would be indeterministic.

Are you not understanding what I'm saying or intentionally gas-lighting?
A contiguous memory _reservation_ is a range of memory like <0xdead0000
0x100> that the kernel (software!) blocks other drivers (software!) from
reserving. This has _nothing_ to do with hardware address line decoding.
It's still about devm_platform_ioremap_resource() and related APIs. Do a
`cat /proc/iomem` to see, e.g., "98007800-9800781f : serial" reservation
in successful case; as mentioned by Leonard, an unsuccessful reservation
usually causes the driver to fail to probe and thus be unavailable.

>  What they don't =

> mandate is that all of the registers in that region be all of one kind. =

> It's certainly possible to have an SoC with one giant IP block with all =

> registers mixed together.  Even in that case, it is still incorrect to =

> have multiple DT entries with overlapping register address ranges.

Says who? Since when? Can we maybe agree that incorrect !=3D invalid?

> It sounds like you're thinking of the difficulties of figuring out how to =

> structure the software driver support for those mixed IP block as a Linux =

> driver:

Yes, these are Linux kernel mailing lists and patches after all... I
don't design hardware, that's why I said we need to live with the flawed
reality of the actual hardware we get.

> where it would fit in the tree, what frameworks it would need to =

> register with, and who would maintain it.  Those issues certainly merit =

> careful thought and consideration.  They aren't related to multiple =

> overlapping address ranges.

Oh they are. Overlapping address ranges of DT nodes are a _result_ of
unexpected hardware design involving blocks not clearly separated the
same way as Linux subsystems (to distinguish from "frameworks") are.

The DT should describe the hardware blocks as they were designed, but on
the other hand, we need to describe it in a way that Linux drivers can
actually bind against the relevant parts and that those drivers can
operate efficiently. There is no ioremap-all-regs helper that I'm aware
of, for instance, as that would result in __iomem base addresses to be
stored per reg entry; compare that to just one for an overlapping range.

Example:

clk@f00 {
	reg =3D <0xf00 0x100>;
}

reset@f0f {
	reg =3D <0xf0c 0x4>;
};

This should be a valid DT example today, as long as the clk driver
doesn't mess with the reset register embedded within its range. In this
case they can't both reserve their ranges as they would mutually cause
each other to fail to probe, depending on probe order.

As I wrote, turning this into

clk@f00 {
	reg =3D <0xf00 0xc>, <0xf10 0xe0>;
};

reset@f0f {
	reg =3D <0xf0c 0x4>;
};

is helping no one and makes things much more complex, especially when
the number of carve-outs grows or is not predetermined, as I noted about
some of my cases. Thus I disagree with you about the overlapping ranges.

DT needs to be designed forward-looking rather than just around the
handful of registers we might read/write today, not just to relieve Rob
from excessive reviews.

My solution was to do

syscon@f00 {
	reg =3D <0xf00 0x100>;
	ranges =3D ...;

	clk@0 {
		reg =3D <0x0 0x100>;
	};

	reset@c {
		reg =3D <0xc 0x4>;
	};
};

https://patchwork.kernel.org/cover/11269453/
https://patchwork.kernel.org/cover/11269971/ (and more in my tree)

which clearly models the blocks and shares a syscon for most children,
other than pre-existing 8250 UART, I=B2C, etc. drivers using platform
helpers such as the one discussed here.

What we lose with syscon is reservations, i.e. /proc/iomem neither
showing the full syscon nor the drivers using parts of it, unless we
explicitly reserve the memory (syscon does the ioremap for us, so no
need for this devm_platform_ioremap_resource helper there).

Also please keep in mind that we actually want to get to the point where
new systems are booting and usable. At least in the Arm world we do have
hardware at plenty to boot Linux. Dying in DT-beauty then is
counter-productive; we also need to come to timely compromises for not
blocking other work. clk drivers don't need to be platform_drivers like
here and thus can coexist easier with other drivers (e.g., syscon
without child), but I clearly contradict the generality in which you
appear to rule out overlapping memory ranges, be it for siblings or for
parent/child.

Hiding overlaps in an mfd driver does not strike me as better than
openly declaring them - if the mfd components are not dynamic, then I
understood simple-mfd were the way to go, which requires some reg(s),
which then for convenience may overlap if there's no clear boundaries.

Regards,
Andreas

-- =

SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer
HRB 36809 (AG N=FCrnberg)
