From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 3/7] ARM: tegra30: cpuidle: add powered-down state for
 secondary CPUs
Date: Wed, 31 Oct 2012 14:19:22 -0700
Message-ID: <CAMbhsRRT60oyecsZqjf196Y=Cog209TwfMCPJ9nyLG+fwu7mqg@mail.gmail.com>
References: <1351676481-28425-1-git-send-email-josephl@nvidia.com>
	<1351676481-28425-4-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351676481-28425-4-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 31, 2012 at 2:41 AM, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> This supports power-gated idle on secondary CPUs for Tegra30. The
> secondary CPUs can go into powered-down state independently. When
> CPU goes into this state, it saves it's contexts and puts itself
> to flow controlled WFI state. After that, it will been power gated.
>
> Be aware of that, you may see the legacy power state "LP2" in the
> code which is exactly the same meaning of "CPU power down".

On Tegra20, LP2 included powering off the GIC.  Is that still the case
for Tegra30 individual secondary cpu power gating?  If so, how do IPIs
to an idle cpu wake it up?
