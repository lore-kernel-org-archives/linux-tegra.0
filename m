From: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
Subject: Re: [PATCH] Warning that occured while compiling the nvec in
 3.19.0-rc5+ is fixed
Date: Sat, 31 Jan 2015 20:11:29 +0100
Message-ID: <CAEA6rAxMk2A54Aa01N0ASoTM=Ty4-dmbBwp8So7+PNaqUj9A=g@mail.gmail.com>
References: <1422705282-17374-1-git-send-email-varsharamt91@gmail.com> <20150131162913.GA23688@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150131162913.GA23688-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: varsharamt <varsharamt91-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, marvin24-Mmb7MZpHnFY@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 31 January 2015 at 17:29, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Sat, Jan 31, 2015 at 05:24:42PM +0530, varsharamt wrote:
>> The task was to fix  a warning which was shown while compiling a driver
>> called NVEC. I wrote a brief description about how to enable support for
>> a nVidya complaint embedded controller.
>
> This makes no sense, what "task"?
>
>> Signed-off-by:Varsha Ram T<varsharamt91-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Please use proper spaces.
>
> Also, this doesn't match your From: line.  And, is this the name you use
> to sign legal documents?
>
>
>> ---
>>  drivers/staging/nvec/Kconfig | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/nvec/Kconfig b/drivers/staging/nvec/Kconfig
>> index 9475e20..a65ad4c 100644
>> --- a/drivers/staging/nvec/Kconfig
>> +++ b/drivers/staging/nvec/Kconfig
>> @@ -3,33 +3,33 @@ config MFD_NVEC
>>       depends on I2C && GPIOLIB && ARCH_TEGRA
>>       select MFD_CORE
>>       help
>> -         Say Y here to enable support for a nVidia compliant embedded
>> -         controller.
>> +     Say Y to enable support for a nVidia complaint embedded controller.
>> +     nVidia complaint embedded controller is used to communicate with EC.
>> +     This is done through I2C bus.
>> +     The request to the EC can be initiated by triggering a gpio line.
>> +     The gpio line is a generic pin on integrated circuit whose input or output pin can be controlled by the user at run time.
>
>
> There's no way this is correct, look at how long your line is.
>

I'm not even sure if this level of detail is needed. Why should anyone
that reads the config option care how NVEC is enabled or communicated
with?

-- 
Julian Andres Klode  - Debian Developer, Ubuntu Member

See http://wiki.debian.org/JulianAndresKlode and http://jak-linux.org/.
