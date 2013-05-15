From: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/4] ARM: tegra: pcie: Enable PCIe controller on Cardhu
Date: Wed, 15 May 2013 22:58:22 +0530
Message-ID: <C79B248886DD134989C8FF6B096A91AB91B4886B5D@BGMAIL01.nvidia.com>
References: <1368010660-31465-1-git-send-email-jagarwal@nvidia.com>
 <1368010660-31465-4-git-send-email-jagarwal@nvidia.com>
 <518A8596.7070702@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <518A8596.7070702-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Juha Tukkinen <jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krishna Thota <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


> On 05/08/2013 04:57 AM, Jay Agarwal wrote:
> > - Enable PCIe controller on Cardhu
> > - Only port 2 is connected on this board
> > - Add regulators required for Tegra30
> > - Patch is based on remotes/gitorious_thierryreding_linux/tegra/next
> > - and should be applied on top of this.
> 
> > diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi
> > b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> 
> > +	pcie-controller {
> > +		status = "okay";
> > +		pex-clk-supply = <&pex_hvdd_3v3_reg>;
> > +		vdd-supply = <&ldo1_reg>;
> > +		avdd-supply = <&ldo2_reg>;
> > +
> > +		pci@3,0 {
> > +			status = "okay";
> > +		};
> > +	};
> 
> So, if I apply this series, I do see the PCIe bridge and Ethernet device get
> enumerated, but I don't see the USB3 controller get enumerated. I believe
> that is a PCIe device behind the same bridge on the same Tegra PCIe port.
> Shouldn't this device show up?
[>]  I have also reproduced this problem. I see somehow no non-prefetchable memory is assigned to any of pcie devices.
Probably that is the reason for USB3 (pci 0000:04:00.0) not getting enumerated since it uses only non-prefetchable memory.
