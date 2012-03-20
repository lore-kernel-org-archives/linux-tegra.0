From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 07/10] pwm: tegra: Add device tree support
Date: Tue, 20 Mar 2012 09:33:01 -0600
Message-ID: <4F68A32D.1000402@wwwdotorg.org>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de> <1331740593-10807-8-git-send-email-thierry.reding@avionic-design.de> <4F67EE9A.6080101@wwwdotorg.org> <20120320084807.GC20249@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120320084807.GC20249-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/20/2012 02:48 AM, Thierry Reding wrote:
> * Stephen Warren wrote:
>> On 03/14/2012 09:56 AM, Thierry Reding wrote:
>>> Add auxdata to instantiate the PWFM controller from a device tree,
>>> include the corresponding nodes in the dtsi files for Tegra 20 and
>>> Tegra 30 and add binding documentation.
>>>
>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>
>>> +++ b/Documentation/devicetree/bindings/pwm/tegra-pwm.txt
>>
>> Can this please be named nvidia,tegra20-pwm.txt so that if we need
>> different bindings for any future Tegra PWM, we won't have any filename
>> conflicts?
> 
> That file already documents the bindings for Tegra 20 and Tegra 30, that's
> why I chose the move generic name. Could this perhaps be documented within
> the file instead? Or should I rather add a nvidia,tegra30-pwm.txt with a
> reference to the nvidia,tegra20-pwm.txt?

I think it's fine for a file of name nvidia,tegra20-pwm.txt to document
both Tegra20 and Tegra30; the file is named after the first/earliest
compatible value it documents. The issue is more that /if/ say TegraNN
needs a different binding, I want the naming consistent (e.g.
nvidia,tegraNN-pwm.txt) rather than having the old file with one style
and the new file named using a different style.
