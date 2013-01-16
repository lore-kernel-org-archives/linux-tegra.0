From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 5/9] ARM: Tegra: Define Tegra30 CAR binding
Date: Wed, 16 Jan 2013 10:30:35 -0700
Message-ID: <50F6E3BB.5060007@wwwdotorg.org>
References: <1357890387-23245-1-git-send-email-pgaikwad@nvidia.com> <1357890387-23245-6-git-send-email-pgaikwad@nvidia.com> <20130116132856.2896df94f553f78273c4574c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130116132856.2896df94f553f78273c4574c-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/16/2013 04:28 AM, Hiroshi Doyu wrote:
> On Fri, 11 Jan 2013 08:46:23 +0100
> Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> The device tree binding models Tegra30 CAR (Clock And Reset)
>> as a single monolithic clock provider.

>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt

>> +Example board file:
>> +
>> +/ {
>> +       clocks {
>> +               compatible = "simple-bug";
> 
> typo, 's/simple-bug/simple-bus/' ?

It was rather accurate though; a simple bug:-)

I've squashed the fix into the patch.
