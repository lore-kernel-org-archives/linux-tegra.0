From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: dt: add header to define GPIO flags
Date: Mon, 04 Mar 2013 10:13:57 -0700
Message-ID: <5134D655.9070608@wwwdotorg.org>
References: <1360791198-29462-1-git-send-email-swarren@wwwdotorg.org> <1360791198-29462-2-git-send-email-swarren@wwwdotorg.org> <20130304083457.0D4333E206B@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130304083457.0D4333E206B@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/04/2013 01:34 AM, Grant Likely wrote:
> On Wed, 13 Feb 2013 14:33:10 -0700, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Many GPIO device tree bindings use the same flags. Create a header to
>> define those.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/gpio.h |   10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/gpio.h
>>
>> diff --git a/arch/arm/boot/dts/gpio.h b/arch/arm/boot/dts/gpio.h
>> new file mode 100644
>> index 0000000..4c9da69
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/gpio.h
> 
> Stephen, you know better than this. This is common code. Don't put it
> under arch/arm.

In V2 of the patch which modifies the dtc+cpp include path:

https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-February/028591.html

... I have moved the common headers to top-level include/dt-bindings, so
it is shared across all arch. I didn't repost all the changes to the *.h
and *.dts* files yet; I was waiting for any comments on the patch above.
