From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] ARM: dt: tegra114: add PWM nodes
Date: Tue, 12 Mar 2013 13:34:59 -0600
Message-ID: <513F8363.8090908@wwwdotorg.org>
References: <1363045695-28874-1-git-send-email-achew@nvidia.com> <20130312192429.GA21924@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130312192429.GA21924-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/12/2013 01:24 PM, Thierry Reding wrote:
> On Mon, Mar 11, 2013 at 04:48:15PM -0700, Andrew Chew wrote: [...]
>> diff --git a/arch/arm/boot/dts/tegra114.dtsi
>> b/arch/arm/boot/dts/tegra114.dtsi
> [...]
>> +	pwm0: pwm@7000a000 {
...
>> +	pwm1: pwm@7000a010 {
...
>> +	pwm2: pwm@7000a020 {
...
>> +	pwm3: pwm@7000a030 {
...
> 
> Shouldn't these rather go into a single PWM node which provides 4
> PWM devices? Just like we do on Tegra20?

Oh yes. Thanks for catching that. I'll remove the patch from the Tegra
tree for now until that's fixed.
