From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] Add support for Tegra Activity Monitor
Date: Fri, 7 Nov 2014 18:07:24 +0900
Message-ID: <545C8BCC.3090908@nvidia.com>
References: <1414594232-15684-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414594232-15684-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/29/2014 11:50 PM, Tomeu Vizoso wrote:
> Hello,
>
> these patches implement support for setting the rate of the EMC clock based on
> stats collected from the ACTMON, a piece of hw in the Tegra124 that counts
> memory accesses (among others).
>
> It depends on the following in-flight patches:
>
> * MC driver: http://thread.gmane.org/gmane.linux.ports.tegra/19623
> * EMC driver: http://thread.gmane.org/gmane.linux.ports.arm.kernel/365125
> * CPUFreq driver: http://thread.gmane.org/gmane.linux.kernel/1812962
>
> I have pushed a branch here for testing:

I am not too familiar with DVFS, but after going through this series it 
really seems to me that this could use devfreq. In its current form this 
driver mixes control and policy and lacks flexibility, preventing e.g. 
to switch to a performance or power-saving profile. Could you study the 
feasibility of using devfreq for this?

I also wonder if this driver could not be made more flexible generally 
speaking - right now it is hardcoded that you can only control EMC 
frequency with it. I can imagine that we could want to control several 
clocks using the same counter information, and that e.g. a notifier 
block might help with that. But let's keep that for later - whether to 
use devfreq or not seems to be the most important question for now.
