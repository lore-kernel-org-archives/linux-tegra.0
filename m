From: Ricard Wanderlof <ricardw-VrBV9hrLPhE@public.gmane.org>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Date: Tue, 28 Jan 2020 08:49:47 +0100
Message-ID: <alpine.DEB.2.20.2001280846330.9620@lnxricardw1.se.axis.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk> <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk> <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com> <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com> <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com> <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk> <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com> <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk> <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk> <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com> <0e0cd260e39ad293edb881da1c565510@codethink.co.uk> <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk> <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk> <3d8544be-af20-f382-85fd-32183365267b@nvidia.com> <318f0256-fe6d-c34d-4deb-74540fca8d0d@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <318f0256-fe6d-c34d-4deb-74540fca8d0d-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org" <linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Fri, 24 Jan 2020, Ben Dooks wrote:

> So I assume aplay has turned the S24_3LE -> S24_LE

A couple of years ago (so may be inaccurate now) I concluded after some 
testing that S24_LE was broken in arecord and aplay, at least when it came 
to .wav files. Meaning that files I recorded with arecord could be played 
back by aplay, but not in any other application I tried, such as Audacity.

I can try to dig out the gory details, but ISTR it came down to the 
header(s) in the .wav file being incorrectly filled in with regard to 
number of bits per sample vs valid bits per sample.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
