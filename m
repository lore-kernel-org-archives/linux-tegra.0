From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: harmony: Add ADT7641 temperature sensor
Date: Fri, 09 Nov 2012 15:06:22 -0700
Message-ID: <509D7E5E.4050301@wwwdotorg.org>
References: <1352498323-31845-1-git-send-email-thierry.reding@avionic-design.de> <20121109220330.GA31801@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121109220330.GA31801-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/09/2012 03:03 PM, Thierry Reding wrote:
> On Fri, Nov 09, 2012 at 10:58:43PM +0100, Thierry Reding wrote:
>> The Harmony board has an Analog Devices ADT7461 temperature
>> sensor connected to the DVC bus. It can be used to monitor the
>> ambient (local) and on-die (remote) temperatures.
>> 
>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> 
> I forgot to add you Tested-by on this patch. Can you add it when
> you apply or do you want me to resend?

Thanks, applied to Tegra's for-3.8/dt branch, with my Tested-by added.
