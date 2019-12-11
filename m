From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Wed, 11 Dec 2019 14:49:06 -0800 (PST)
Message-ID: <alpine.DEB.2.21.9999.1912111411120.73923@viisi.sifive.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20191210132146.GF2703785@ulmo>
 <8ff73b97-cf2e-0c91-2764-05ce4c548b06@suse.de>
 <alpine.DEB.2.21.999.1912111751490.32095@utopia.booyaka.com>
 <76d72777-b144-0679-1f4c-1136496a5f06@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1646688419-1576102796=:73923"
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <76d72777-b144-0679-1f4c-1136496a5f06@suse.de>
Content-ID: <alpine.DEB.2.21.9999.1912111420030.73923@viisi.sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "heiko@sntech.de" <heiko@sntech.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, Yangtao Li <tiny.windzz@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "rfontana@redhat.com" <rfontana@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>, "krzk@kernel.org" <krzk@kernel.org>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Leonard Crestez <leonard.cres>
List-Id: linux-tegra@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1646688419-1576102796=:73923
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.DEB.2.21.9999.1912111420031.73923@viisi.sifive.com>

On Wed, 11 Dec 2019, Andreas F=E4rber wrote:

> Blocks do have names, but they don't always group registers of the same
> kind, as Linux expects it

Linux does not expect that all of the registers in the same IP block are=20
of the same kind.  That's part of the reason why Linux frameworks exist. =
=20
To consider clocks as the present example, you're welcome to register=20
local IP block clock control registers in the local IP block driver via=20
the clock framework.  There's no need for a separate clock driver with an=
=20
overlapping address range, or anything like that.

This is nothing new with Realtek.  IP blocks that contain many different=20
kinds of registers have had Linux driver support without requiring=20
overlapping register address ranges long before Realtek ARM SoCs=20
appeared.

> Just please accept that hardware does not always allow for unique=20
> contiguous memory reservations

Hardware designs do in fact mandate unique contiguous memory reservations,=
=20
otherwise address decoding would be indeterministic.  What they don't=20
mandate is that all of the registers in that region be all of one kind.=20
It's certainly possible to have an SoC with one giant IP block with all=20
registers mixed together.  Even in that case, it is still incorrect to=20
have multiple DT entries with overlapping register address ranges.

It sounds like you're thinking of the difficulties of figuring out how to=
=20
structure the software driver support for those mixed IP block as a Linux=
=20
driver: where it would fit in the tree, what frameworks it would need to=20
register with, and who would maintain it.  Those issues certainly merit=20
careful thought and consideration.  They aren't related to multiple=20
overlapping address ranges.


- Paul
--8323329-1646688419-1576102796=:73923--
