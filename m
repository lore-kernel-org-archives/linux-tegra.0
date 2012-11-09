From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: harmony: Add ADT7641 temperature sensor
Date: Fri, 09 Nov 2012 10:36:13 -0700
Message-ID: <509D3F0D.5040204@wwwdotorg.org>
References: <1352465815-26984-1-git-send-email-thierry.reding@avionic-design.de> <20121109132257.GA29183@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121109132257.GA29183-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/09/2012 06:22 AM, Thierry Reding wrote:
> On Fri, Nov 09, 2012 at 01:56:55PM +0100, Thierry Reding wrote:
>> The Harmony board has an Analog Devices ADT7461 temperature
>> sensor connected to the DVC bus. It can be used to monitor the
>> ambient (local) and on-die (remote) temperatures.
> 
> Note that I haven't actually tested this, as I no longer have
> access to Harmony hardware. Testing can easily be done either by
> reading the files from sysfs directly or by running the sensors
> utility from the lm-sensors package.

OK, I can test this. The same comment about the DT node name that I
made for the other patch applies here too.
