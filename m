From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 1/5] ARM: add basic Trusted Foundations support
Date: Tue, 10 Sep 2013 14:18:03 +0100
Message-ID: <CAHkRjk5pqKv0U+NdSf+PmXQkO7jGwKnz+9cL9XX5FOvJSjjswQ@mail.gmail.com>
References: <1378351680-14696-1-git-send-email-acourbot@nvidia.com>
 <1378351680-14696-2-git-send-email-acourbot@nvidia.com> <5228CEDB.1090306@gmail.com>
 <CAAVeFu+MGGBfmm1jwtKGP_d3EjkLdf5B_E_5RT___PVh1e=8jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFu+MGGBfmm1jwtKGP_d3EjkLdf5B_E_5RT___PVh1e=8jw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 9 September 2013 07:15, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Sep 6, 2013 at 3:35 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 09/04/2013 10:27 PM, Alexandre Courbot wrote:
>>> Trusted Foundations is a TrustZone-based secure monitor for ARM that
>>> can be invoked  using a consistent SMC-based API on all supported
>>> platforms. This patch adds initial basic support for Trusted
>>> Foundations using the ARM firmware API. Current features are limited
>>> to the ability to boot secondary processors.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  .../arm/firmware/tl,trusted-foundations.txt        | 17 +++++
>>>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>>>  arch/arm/Kconfig                                   |  2 +
>>>  arch/arm/Makefile                                  |  1 +
>>>  arch/arm/firmware/Kconfig                          | 25 +++++++
>>>  arch/arm/firmware/Makefile                         |  1 +
>>>  arch/arm/firmware/trusted_foundations.c            | 82 ++++++++++++++++++++++
>>>  arch/arm/include/asm/trusted_foundations.h         | 53 ++++++++++++++
>>>  8 files changed, 182 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/arm/firmware/tl,trusted-foundations.txt
>>>  create mode 100644 arch/arm/firmware/Kconfig
>>>  create mode 100644 arch/arm/firmware/Makefile
>>>  create mode 100644 arch/arm/firmware/trusted_foundations.c
>>>  create mode 100644 arch/arm/include/asm/trusted_foundations.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/firmware/tl,trusted-foundations.txt b/Documentation/devicetree/bindings/arm/firmware/tl,trusted-foundations.txt
>>> new file mode 100644
>>> index 0000000..3954bbd
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/firmware/tl,trusted-foundations.txt
>>> @@ -0,0 +1,17 @@
>>> +Trusted Foundations
>>> +
>>> +Boards that use the Trusted Foundations secure monitor can signal its
>>> +presence by declaring a node compatible with "tl,trusted-foundations"
>>> +under the root node.
>>> +
>>> +Required properties:
>>> +- compatible : "tl,trusted-foundations"
>>> +- version-major : major version number of Trusted Foundations firmware
>>> +- version-minor: minor version number of Trusted Foundations firmware
>>> +
>>> +Example:
>>> +     firmware {
>>> +             compatible = "tl,trusted-foundations";
>>> +             version-major = <2>;
>>> +             version-minor = <8>;
>>> +     };
>>
>> I'm wondering how we fit this in with PSCI bindings? Both are pieces of
>> firmware functionality and may co-exist. There's nothing incompatible
>> here, but there should be some commonality. Will future versions of
>> Trusted Foundations follow the SMC calling conventions doc? What about
>> armv8 support.
>
> I don't have any information about the future of TF unfortunately,
> excepted that it should remain backward-compatible. What is this SMC
> calling convention doc your are talking about btw? Is there a standard
> calling convention defined by ARM?

The SMC calling convention is here (it requires free registration):

http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html

From the introduction:

"This document defines a common calling mechanism for use with the
Secure Monitor Call (SMC)
instruction in both the ARMv7 and ARMv8 architectures.

The SMC instruction is used to generate a synchronous exception that
is handled by Secure Monitor code running in EL3. The arguments are
passed in registers and then used to select which Secure function to
execute. These calls may then be passed on to a Trusted OS in S-EL1.

This specification aims to ease integration and reduce fragmentation
between software layers, such as Operating Systems, Hypervisors,
Trusted OS, Secure Monitor and System Firmware."


If you talk about booting secondary CPUs, there is also PSCI:

http://infocenter.arm.com/help/topic/com.arm.doc.den0022b/index.html

-- 
Catalin
