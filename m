From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Add CPU and PSCI nodes for NVIDIA Tegra210
 platforms
Date: Tue, 28 Mar 2017 19:54:09 +0100
Message-ID: <20170328185409.GG8643@leverpostej>
References: <1490701718-16571-1-git-send-email-jonathanh@nvidia.com>
 <9069e2fd-bf7b-b1df-3d1b-071ee21642ef@wwwdotorg.org>
 <f9c59c65-de48-108d-73df-c659cc3300e6@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f9c59c65-de48-108d-73df-c659cc3300e6-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 28, 2017 at 05:49:41PM +0100, Jon Hunter wrote:
> 
> On 28/03/17 17:23, Stephen Warren wrote:
> > On 03/28/2017 05:48 AM, Jon Hunter wrote:
> >> Add the CPU and PSCI nodes for the NVIDIA Tegra210 platforms so that
> >> all CPUs can be enabled on boot. This assumes that the PSCI firmware
> >> has been loaded during the initial bootstrap on the device before the
> >> kernel starts (which is typically the case for these platforms). The
> >> PSCI firmware version is set to v0.2 which aligns with the current
> >> shipping version for Tegra.
> > 
> > This seems fine, although I'd expect PSCI to be used everywhere on
> > Tegra, so putting this in tegra210.dtsi would make more sense.
> 
> It's fine with me. Although technically, tegra210-smaug ships with
> psci-v1.0 and tegra210-jetson-tx1 currently have psci-v0.2. However, I
> did test both with the psci version set to v1.0 and the jetson-tx1, did
> detect the version automatically and reverted to v0.2 (which is a
> feature of psci >= v0.2). 

Please don't rely upon that.

If the DT lists 0.2 and the FW reports 1.0 we deliberately upgrade and
treat it as 1.0, but the other way around was not a deliberate decision.

If the FW is not necessarily 1.0, please do not list 1.0 in the DT.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
