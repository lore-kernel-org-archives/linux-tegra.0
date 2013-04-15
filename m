From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] rtc: palmas: add dt support
Date: Mon, 15 Apr 2013 13:57:41 +0100
Message-ID: <20130415125741.BFD023E0AA8@localhost>
References: <1363876330-26003-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363876330-26003-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org
Cc: a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, linux-tegra@vger.kernel.org, swarren@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, 21 Mar 2013 20:02:10 +0530, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> Add of_device_id table for Palma RTC to be enable the
> driver from DT file.
> 
> The driver can be registered from DT file as:
> 	palmas: tps65913@58 {
> 		:::::::::::
> 		palmas_rtc {
> 			compatible = "ti,palmas-rtc";
> 			interrupt-parent = <&palmas>;
> 			interrupts = <8 0>;
> 		};
> 	};
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Pretty trivial...

Acked-by: Grant Likely <grant.likely@secretlab.ca>

g.
