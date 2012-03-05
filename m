From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: obtaining a regulator from a phandle
Date: Mon, 5 Mar 2012 08:44:46 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BE861C09@HQMAIL01.nvidia.com>
References: <20120305152157.GA12927@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120305152157.GA12927-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Monday, March 05, 2012 8:22 AM:
> I'm working on getting DT support for PCIe on Tegra working. The Tegra PCIe
> controller needs a specific voltage supplied by a regulator on the board that
> I use (Harmony-compatible), so what I did was add DT support for the PMU
> (tps6586x) to provide the corresponding regulator:
...
> Within the device node of the PCIe controller, I reference the ldo0 regulator
> like so:
> 
> 	pcie@80000000 {
> 		pex-clk-supply = <&ldo0_reg>;
> 	};
> 
> This all works well, except there seems to be no API to obtain a regulator
> from the DT phandle.

regulator_get(pcie_dev, "pex-clk") should work.

Of course, the PCIe host on Tegra isn't yet a platform device, so would
have to be converted.

-- 
nvpublic
