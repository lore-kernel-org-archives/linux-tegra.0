From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Date: Wed, 29 Jan 2020 17:52:21 +0000
Message-ID: <f225524b-91a4-e87d-6834-1b776de774c1@codethink.co.uk>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200128121315.GD4689-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 28/01/2020 12:13, Mark Brown wrote:
> On Mon, Jan 27, 2020 at 10:20:25PM +0300, Dmitry Osipenko wrote:
>> 24.01.2020 19:50, Jon Hunter пишет:
> 
>>>                  .rates = SNDRV_PCM_RATE_8000_96000,
>>>                  .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>> -                          SNDRV_PCM_FMTBIT_S24_LE |
>>> +                          SNDRV_PCM_FMTBIT_S24_3LE |
> 
>> It should solve the problem in my particular case, but I'm not sure that
>> the solution is correct.
> 
> If the format implemented by the driver is S24_3LE the driver should
> advertise S24_3LE.

I am fairly sure the format is S24_LE, the tegra3 hardware only
supports 24bits padded to 32 bits.

>> The v5.5 kernel is released now with the broken audio and apparently
>> getting 24bit to work won't be trivial (if possible at all). Ben, could
>> you please send a patch to fix v5.5 by removing the S24 support
>> advertisement from the driver?
> 
> Why is that the best fix rather than just advertising the format
> implemented by the driver?
> 
> I really don't understand why this is all taking so long, this thread
> just seems to be going round in interminable circles long after it
> looked like the issue was understood.  I have to admit I've not read
> every single message in the thread but it's difficult to see why it
> doesn't seem to be making any progress.
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
