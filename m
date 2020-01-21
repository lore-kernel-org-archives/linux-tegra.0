From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
 samples
Date: Tue, 21 Jan 2020 18:15:30 +0000
Message-ID: <9fc97644-b679-ef9f-41ca-1d3a5f296f3a@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <eb90ee78-e462-401a-de60-4a9bfc2a00c4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eb90ee78-e462-401a-de60-4a9bfc2a00c4-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/01/2020 10:29, Jon Hunter wrote:
> 
> On 05/01/2020 10:53, Ben Dooks wrote:
>>
>>
>> On 2020-01-05 01:48, Dmitry Osipenko wrote:
>>> 05.01.2020 03:04, Ben Dooks пишет:
>>>> [snip]
>>>>
>>>> I've just gone through testing.
>>>>
>>>> Some simple data tests show 16 and 32-bits work.
>>>>
>>>> The 24 bit case seems to be weird, it looks like the 24-bit expects
>>>> 24 bit samples in 32 bit words. I can't see any packing options to
>>>> do 24 bit in 24 bit, so we may have to remove 24 bit sample support
>>>> (which is a shame)
>>>>
>>>> My preference is to remove the 24-bit support and keep the 32 bit in.
>>>>
>>>
>>> Interesting.. Jon, could you please confirm that 24bit format isn't
>>> usable on T30?
>>
>> If there is an option of 24 packed into 32, then I think that would work.
>>
>> I can try testing that with raw data on Monday.
> 
> I will check on this. I would have thought that S24_LE (24-bits packed
> into 32-bit elements) would be fine. Typically we don't support S24_3LE
> (24-bits in 24-bit elements).
> 

I've just had to spend time fixing pulseview/sigrok's i2s handling for
this, but have run a simple test of S24_LE using a pattern generator
and the low level output looks ok.

I will test a bit more tomorrow, but I suspect something else is either
getting S24_LE wrong or we have some other issue.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
