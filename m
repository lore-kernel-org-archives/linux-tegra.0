From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Sat, 08 Jun 2013 15:00:35 +0200
Message-ID: <4532876.1zmFKV0LLN@ax5200p>
References: <1370680435.24531.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370680435.24531.12.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Cc: linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thomas,

On Saturday 08 June 2013 10:33:55 Thomas Meyer wrote:
> Hi,
> 
> Kernel version: 3.10.0-0.rc4.git0.1.fc20.armv7hl
> 
> This is the latest Fedora ARM kernel. Config is available here:
> http://pkgs.fedoraproject.org/cgit/kernel.git/tree/config-armv7
> 
> Package is here:
> http://arm.koji.fedoraproject.org/koji/packageinfo?packageID=3547
> 
> After connecting my LC display to the hdmi output, it tells me that the
> "singal is out of range"
> 
> This is what I see in the kernel log:
> 
> $ dmesg |grep hdmi
> [   33.403417] tegra-hdmi 54280000.hdmi: failed to get VDD regulator
> [   33.403441] platform 54280000.hdmi: Driver tegra-hdmi requests probe
> deferral [   33.429833] +3.3vs_ldo7,avdd_hdmi: 3300 mV
> [   33.430023] +3.3vs_ldo7,avdd_hdmi: supplied by +3.7vs_sm2,vin_ldo*
> [   33.431246] +1.8vs_ldo8,avdd_hdmi_pll: 1800 mV
> [   33.431434] +1.8vs_ldo8,avdd_hdmi_pll: supplied by +3.7vs_sm2,vin_ldo*
> [  979.737773] tegra-hdmi 54280000.hdmi: cannot set audio to 44100 at
> 65000000 pclk
> 
> any ideas?

is the regulator (tps6586x) build-in? The make everything a module path isn't 
well tested I guess. 

Marc
