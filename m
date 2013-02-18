From: Rajanikanth HV <rajanikanth.hv@stericsson.com>
Subject: Re: [RFC 1/3] power_supply: Define Binding for supplied-nodes
Date: Mon, 18 Feb 2013 11:34:30 +0530
Message-ID: <5121C46E.1030007@stericsson.com>
References: <1360971416-30717-1-git-send-email-rklein@nvidia.com> <1360971416-30717-2-git-send-email-rklein@nvidia.com> <20130216223804.GF1741@lizard.sbx05280.losalca.wayport.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130216223804.GF1741@lizard.sbx05280.losalca.wayport.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <anton@enomsg.org>
Cc: Rhyland Klein <rklein@nvidia.com>, David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org


On Sunday 17 February 2013 04:08 AM, Anton Vorontsov wrote:
[...]
> 
> "supplied nodes" sounds confusing (doesn't reflect direction), IMO. I'd
> rather call it power-supply,supplied-to = <&some_battery>;
> 
> But... I'm recalling there was a similar discussion not that long ago, and
> Arnd came up with the idea that supplied-to is not fully in spirit of DT,
> and proposed his view of proper bindings. Please find the discussion here:
> 
>   http://lkml.org/lkml/2012/9/14/104
'supplied-to or supplied nodes' is specific to "power-supply core and
battery managed devices/drivers" and not platform specific.
Dependent battery drivers interacts/shares power supply events with the
help of 'supplied_to' 'num_supplicants' and external_power_changed(...)
identifiers which are defined and fixed during driver design, it will be
more meaningful to have it internal to drivers instead DT.
Ref: ab8500_[fg,btemp,charger].c, abx500_chargalg.c and
arch/arm/boot/dts/dbx5x0.dtsi


Thanks,
Rajanikanth
[...]
