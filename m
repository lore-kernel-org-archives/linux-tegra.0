From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Wed, 11 Dec 2019 18:38:11 +0000
Message-ID: <VI1PR04MB7023943556EB5E6967AE3E0CEE5A0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20191210132146.GF2703785@ulmo>
 <alpine.DEB.2.21.999.1912111743560.32095@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Paul Walmsley <paul@pwsan.com>, Thierry Reding <thierry.reding@gmail.com>, "sboyd@kernel.org" <sboyd@kernel.org>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "heiko@sntech.de" <heiko@sntech.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, Yangtao Li <tiny.windzz@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "palmer@sifive.com" <palmer@sifive.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "rfontana@redhat.com" <rfontana@redhat.com>, "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "robh@kernel.org" <robh@ke>
List-Id: linux-tegra@vger.kernel.org

On 11.12.2019 19:51, Paul Walmsley wrote:=0A=
> On Tue, 10 Dec 2019, Thierry Reding wrote:=0A=
>> On Mon, Dec 09, 2019 at 08:44:39PM +0000, Leonard Crestez wrote:=0A=
>>=0A=
>>> This breaks imx8qxp-mek boot by causing most peripherals (like uart) to=
=0A=
>>> fail to probe.=0A=
>>>=0A=
>>> The old and new paths are not equivalent: devm_platform_ioremap_resourc=
e=0A=
>>> calls devm_ioremap_resource which differs from devm_ioremap by also=0A=
>>> calling devm_request_mem_region.=0A=
>>>=0A=
>>> This prevents other mappings in the area and imx8qxp-lpcg nodes map=0A=
>>> whole hardware "subsystems" and overlap most peripherals. For example:=
=0A=
>>>=0A=
>>>                    adma_lpcg: clock-controller@59000000 {=0A=
>>>                            compatible =3D "fsl,imx8qxp-lpcg-adma";=0A=
>>>                            reg =3D <0x59000000 0x2000000>;=0A=
>>>                            #clock-cells =3D <1>;=0A=
>>> 		};=0A=
>>>=0A=
>>>                   adma_lpuart0: serial@5a060000 {=0A=
>>> 			reg =3D <0x5a060000 0x1000>;=0A=
>>> 			...=0A=
>>> 		};=0A=
>>=0A=
>> The whole point of doing a request_mem_region() is to avoid having=0A=
>> multiple drivers trample on each others' mappings. What you do above=0A=
>> doesn't look right. Why does that clock controller need access to 32=0A=
>> MiB of I/O memory space?=0A=
> =0A=
> Thierry's right; your DT data looks broken.  Unfortunately the IMX8M TRM=
=0A=
> requires some sort of signup to download, so I can't easily read it, but=
=0A=
> based on files like this:=0A=
> =0A=
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%=
2Fdrivers%2Fclk%2Fimx%2Fclk-imx8qxp-lpcg.h&amp;data=3D02%7C01%7Cleonard.cre=
stez%40nxp.com%7Cf0e68024888e4aed777e08d77e62c5df%7C686ea1d3bc2b4c6fa92cd99=
c5c301635%7C0%7C1%7C637116835018036168&amp;sdata=3Dz70QUYwknXfvc4zhyOrT7dcL=
Pq5eryv4U7HoGMzI4ZE%3D&amp;reserved=3D0=0A=
> =0A=
> it looks like what should be in the DT instead is either a large set of=
=0A=
> smaller register ranges, or a set of separate DT nodes/drivers: one per=
=0A=
> peripheral LPCG instance.  That should avoid the overlapping memory range=
=0A=
> issue.=0A=
=0A=
Yes, current imx8 clock DT bindings are definitely odd. I only objected =0A=
to the cleanup because it breaks boot.=0A=
=0A=
This series converts imx8 LPCG to use separate DT nodes for each =0A=
peripheral LPCG instance and makes other improvements, it's just been =0A=
stuck in review:=0A=
=0A=
https://patchwork.kernel.org/cover/11248249/=0A=
=0A=
Having a large number of clock-providing DT nodes is also odd but it =0A=
closely aligns with SOC hardware architecture. The clock gating bits =0A=
were deliberately split into many 64k areas so that access can be =0A=
controlled for each peripheral using very coarse-grained access control =0A=
methods.=0A=
=0A=
For example hypervisors can control guest access on page boundaries but =0A=
not to individual bits in a byte.=0A=
=0A=
This design makes it easy to securely grant control for a peripheral and =
=0A=
all of its clock bits to an M4 core or virtualization guest without =0A=
additional layers of software indirection.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
