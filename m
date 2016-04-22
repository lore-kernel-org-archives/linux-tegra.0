From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: tegra: correct Beaver pinmux
Date: Fri, 22 Apr 2016 12:00:37 -0600
Message-ID: <571A66C5.8070609@wwwdotorg.org>
References: <1456514310-27605-1-git-send-email-dev@lynxeye.de>
 <20160422114642.GD9047@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160422114642.GD9047-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/22/2016 05:46 AM, Thierry Reding wrote:
> On Fri, Feb 26, 2016 at 08:18:30PM +0100, Lucas Stach wrote:
>> Update pinmux to get rid of invalid uses of the rsvd1 function, which lead
>> to the mux settings on those pins to not be applied.
>>
>> Also add correct drive settings, derived from the Tegra3 TRM, for SDIO1,
>> which makes some more SD-cards work.
>>
>> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/tegra30-beaver.dts | 39 ++++++++++++++++++++++--------------
>>   1 file changed, 24 insertions(+), 15 deletions(-)
>
> Applied, thanks.
>
> Stephen, you had looked at this before. If you're happy with it, would
> you mind providing an Acked-by? I can apply it after the fact.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This appears to match a recent change in tegra-pinmux-scripts.git.
