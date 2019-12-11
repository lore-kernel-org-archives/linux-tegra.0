From: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Wed, 11 Dec 2019 17:57:26 +0000 (UTC)
Message-ID: <alpine.DEB.2.21.999.1912111751490.32095@utopia.booyaka.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20191210132146.GF2703785@ulmo>
 <8ff73b97-cf2e-0c91-2764-05ce4c548b06@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="843723315-249778640-1576086897=:32095"
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <8ff73b97-cf2e-0c91-2764-05ce4c548b06@suse.de>
Content-ID: <alpine.DEB.2.21.999.1912111755220.32095@utopia.booyaka.com>
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
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "heiko@sntech.de" <heiko@sntech.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, Yangtao Li <tiny.windzz@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "palmer@sifive.com" <palmer@sifive.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "rfontana@redhat.com" <rfontana@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>, "krzk@kernel.org" <krzk@kernel.org>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Leonard Crestez <leonard.crestez@nxp.com>f
List-Id: linux-tegra@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--843723315-249778640-1576086897=:32095
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.999.1912111755221.32095@utopia.booyaka.com>

On Tue, 10 Dec 2019, Andreas Färber wrote:

> I have similar cases with Realtek where registers are simply not grouped
> into convenient blocks but spread across large memory regions.

At the hardware level, registers are grouped into IP blocks, to simply 
both design integration and address decoding.  Not knowing which Realtek 
device you're referring to, most likely it's the same situation as with 
the IMX8M TRM, where the DT data doesn't match the underlying reality of 
the hardware.  In those cases the best approach is usually to just fix the 
DT data.


- Paul
--843723315-249778640-1576086897=:32095--
