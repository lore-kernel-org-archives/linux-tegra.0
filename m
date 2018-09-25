From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 34/34] ARM: tegra: apalis_t30: support v1.1 hardware
 revision
Date: Tue, 25 Sep 2018 13:32:50 -0500
Message-ID: <20180925183250.GA25639@bogus>
References: <20180831163817.23970-1-marcel@ziswiler.com>
 <20180831163817.23970-35-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180831163817.23970-35-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 31, 2018 at 06:38:16PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Support the V1.1 hardware revisions with the following change:
> 
> Changed power rail for MMC1 interface to a 3.3V/1.8V switchable rail in
> order to be able to run UHS SD cards in ultra high speed 1.8V mode.
> 
> [  207.502011] mmc2: host does not support reading read-only switch,
>  assuming write-enable
> [  207.517011] mmc2: new ultra high speed SDR104 SDHC card at address
>  aaaa
> [  207.534190] mmcblk2: mmc2:aaaa SE32G 29.7 GiB
> [  207.545096]  mmcblk2: p1
> 
> root@apalis-t30:~# cat /sys/kernel/debug/mmc2/ios
> clock:          208000000 Hz
> actual clock:   204000000 Hz
> vdd:            21 (3.3 ~ 3.4 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      2 (4 bits)
> timing spec:    6 (sd uhs SDR104)
> signal voltage: 1 (1.80 V)
> driver type:    0 (driver type B)
> root@apalis-t30:~# hdparm -t /dev/mmcblk2
> 
> /dev/mmcblk2:
>  Timing buffered disk reads: 256 MB in  3.02 seconds =  84.71 MB/sec
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---

> +	panel: panel {
> +		/*
> +		 * edt,et057090dhu: EDT 5.7" LCD TFT
> +		 * edt,et070080dh6: EDT 7.0" LCD TFT
> +		 */
> +		compatible = "edt,et057090dhu", "simple-panel";

"simple-panel" is not a valid compatible string.

> +		backlight = <&backlight>;
> +		power-supply = <&reg_3v3>;
> +	};

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
