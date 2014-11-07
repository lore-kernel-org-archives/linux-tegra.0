From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH 0/3] Add support for Tegra Activity Monitor
Date: Fri, 07 Nov 2014 13:35:19 +0100
Message-ID: <545CBC87.7050404@collabora.com>
References: <1414594232-15684-1-git-send-email-tomeu.vizoso@collabora.com> <545C8BCC.3090908@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545C8BCC.3090908-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/07/2014 10:07 AM, Alexandre Courbot wrote:
> On 10/29/2014 11:50 PM, Tomeu Vizoso wrote:
>> Hello,
>>
>> these patches implement support for setting the rate of the EMC clock based on
>> stats collected from the ACTMON, a piece of hw in the Tegra124 that counts
>> memory accesses (among others).
>>
>> It depends on the following in-flight patches:
>>
>> * MC driver: http://thread.gmane.org/gmane.linux.ports.tegra/19623
>> * EMC driver: http://thread.gmane.org/gmane.linux.ports.arm.kernel/365125
>> * CPUFreq driver: http://thread.gmane.org/gmane.linux.kernel/1812962
>>
>> I have pushed a branch here for testing:
> 
> I am not too familiar with DVFS, but after going through this series it 
> really seems to me that this could use devfreq. In its current form this 
> driver mixes control and policy and lacks flexibility, preventing e.g. 
> to switch to a performance or power-saving profile. Could you study the 
> feasibility of using devfreq for this?

Yeah, I started writing a devfreq driver, but then I looked in more
detail to the downstream driver and realized that most of the
functionality that devfreq provides overlaps with the hw.

The ACTMON can be configured to fire an interrupt when a set of
thresholds are crossed, similar to the simple-ondemand governor but a
bit more sophisticated. The only functionality of the governors that
isn't covered by the ACTMON hw is determining the new frequency after a
threshold has been crossed, but if we want to retain the flexibility of
the downstream solution, we would need to write a new governor anyway.

I realize that it would be cool to reuse the code in devfreq, but being
able to let the hw sample the counters, calculating averages and
checking if a threshold has been crossed without the cpu having to
intervene gives this SoC quite an edge when compared to its competitors.

Regards,

Tomeu
