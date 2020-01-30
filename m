From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [alsa-devel] (no subject)
Date: Thu, 30 Jan 2020 09:39:33 +0000
Message-ID: <8161fc88-fa8c-ec92-cc14-1caa5c6f2fe7@codethink.co.uk>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
 <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
 <2ff97414-f0a5-7224-0e53-6cad2ed0ccd2@gmail.com>
 <35667c85-67b5-6f6f-ffe8-4fe3455ea4bb@codethink.co.uk>
 <96ed04cb-24ab-7e4d-bd44-6a4bb7c046ac@ladisch.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <96ed04cb-24ab-7e4d-bd44-6a4bb7c046ac-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 30/01/2020 09:31, Clemens Ladisch wrote:
> Ben Dooks wrote:
>> On 29/01/2020 00:17, Dmitry Osipenko wrote:
>>> 28.01.2020 21:19, Jon Hunter пишет:
>>>> On 28/01/2020 17:42, Dmitry Osipenko wrote:
>>>>> 28.01.2020 15:13, Mark Brown пишет:
>>>>>> On Mon, Jan 27, 2020 at 10:20:25PM +0300, Dmitry Osipenko wrote:
>>>>>>> 24.01.2020 19:50, Jon Hunter пишет:
>>>>>>
>>>>>>>>                   .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>>                   .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>>>> -                          SNDRV_PCM_FMTBIT_S24_LE |
>>>>>>>> +                          SNDRV_PCM_FMTBIT_S24_3LE |
>>>>>>
>>>>>>> It should solve the problem in my particular case, but I'm not sure that
>>>>>>> the solution is correct.
>>>>>>
>>>>>> If the format implemented by the driver is S24_3LE the driver should
>>>>>> advertise S24_3LE.
>>>>>
>>>>> It should be S24_LE, but seems we still don't know for sure.
>>>>
>>>> Why?
>>> /I think/ sound should be much more distorted if it was S24_3LE, but
>>> maybe I'm wrong.
>>
>> S24_3LE is IICC the wrong thing and we can't support it on the tegra3
> 
> There are three ways of arranging 24-bit samples in memory:
> 
> S24_3LE: 24-bit samples in 24-bit words without padding
> S24_LE:  24-bit samples in 32-bit words, aligned to the LSB
> S32_LE:  24-bit samples in 32-bit words, aligned to the MSB
> 
> It is very unlikely that your hardware implements S24_LE.

Which is wrong, since this is exactly what the hardware implements.

The DMA fetches 32 bit words, and then the front end dispatches only
24 bits of these to the I2S/TDM

> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
