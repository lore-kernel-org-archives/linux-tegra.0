From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 3/3] ARM: tegra114: cpuidle: add powered-down state
Date: Wed, 12 Jun 2013 11:41:28 -0600
Message-ID: <51B8B2C8.1090006@wwwdotorg.org>
References: <1370342880-422-1-git-send-email-josephl@nvidia.com> <1370342880-422-4-git-send-email-josephl@nvidia.com> <51AE5EE3.3010607@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51AE5EE3.3010607-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/04/2013 03:40 PM, Daniel Lezcano wrote:
> On 06/04/2013 12:48 PM, Joseph Lo wrote:
>> This supports CPU core power down on each CPU when CPU idle. When CPU go
>> into this state, it saves it's context and needs a proper configuration
>> in flow controller to power gate the CPU when CPU runs into WFI
>> instruction. And the CPU also needs to set the IRQ as CPU power down idle
>> wake up event in flow controller.
>>
>> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> I would like to understand why there is a WARN with the
> CPUIDLE_FLAG_TIMER_STOP flag set before queuing this patch and ensure it
> is not the tree hiding the forest.

Joseph, are you planning to post an updated series or respond to resolve
Daniel's question?
