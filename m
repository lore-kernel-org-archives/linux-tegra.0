From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH V2 1/4] Add crc32 verification of the flash image
Date: Fri, 06 Dec 2013 13:01:28 -0700
Message-ID: <52A22D18.309@wwwdotorg.org>
References: <1386351334-25766-1-git-send-email-swarren@wwwdotorg.org> <20131206195637.GB923@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131206195637.GB923@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/06/2013 12:56 PM, Thierry Reding wrote:
> On Fri, Dec 06, 2013 at 10:35:33AM -0700, Stephen Warren wrote:
> [...]
>> diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
> [...]
>> @@ -125,6 +129,19 @@ def func_flash():
>>      if args.debug:
>>          print 'flash_img_size %d 0x%x' % (flash_img_size, flash_img_size)
>>  
>> +    imgf = file(flash_img, 'rb')
>> +    imgd = imgf.read()
>> +    imgf.close()
>> +    flash_img_crc32 = binascii.crc32(imgd)
>> +    if args.debug:
>> +        print 'flash_img_crc32 %x' % flash_img_crc32
>> +    flash_img_crc32_bs = (
>> +        ((flash_img_crc32 & 0xff) << 24) |
>> +        ((flash_img_crc32 & 0xff00) << 8) |
>> +        ((flash_img_crc32 & 0xff0000) >> 8) |
>> +        ((flash_img_crc32 & 0xff000000) >> 24)
>> +    )
> 
> I would've thought that Python actually supported byteswapping with some
> function, but it seems not (or at least not trivially). One could do
> something like this:
> 
> 	a = array.array('I', [crc])
> 	a.byteswap()
> 	crc = a[0]
> 
> But with the array module you apparently can't force 32-bit values. 'I'
> will be at least 2, but 4 on 32-bit and 64-bit systems, 'L' will be 64
> bits on 64-bit systems and 32 bits on 32-bit systems it seems. You could
> check a.itemsize to determine the right type code. I suppose we won't be
> running on anything but 32- or 64-bit systems for a while, but it still
> said there's no support for sized types there.
> 
> It could possibly be done with the struct module as well, but that would
> likely end up much more verbose too, so:

Thanks. I did wonder about using the struct module, but I also figured
that since I'd already written the conversion, and struct would be
more complex, I wouldn't bother.

I'll push out the whole 4-patch series in a second.
