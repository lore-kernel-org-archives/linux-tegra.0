From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Date: Tue, 28 Jan 2020 20:45:11 +0300
Message-ID: <a9ed4d18-94f6-06e0-d7b7-cbbcbee058b0@gmail.com>
References: <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <1aa6a4bf-10ea-001d-2d35-44494d9554f8@gmail.com>
 <62cea895-c1f1-a833-b63c-050642bb8a79@codethink.co.uk>
 <d6bb92e2-16ba-3c00-2f07-e741ecaa5ec8@nvidia.com>
 <20200128152632.GF4689@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200128152632.GF4689-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

28.01.2020 18:26, Mark Brown пишет:
> On Tue, Jan 28, 2020 at 01:19:17PM +0000, Jon Hunter wrote:
>> On 28/01/2020 08:59, Ben Dooks wrote:
>>> On 27/01/2020 19:23, Dmitry Osipenko wrote:
>>>> 27.01.2020 22:20, Dmitry Osipenko пишет:
>>>> I also suspect that s32 may need some extra patches and thus could be
>>>> worthwhile to stop advertising it as well.
> 
>>> As far as I am aware that works and we can hit the audio rates for it.
> 
>> I ran a test on Tegra124 Jetson-TK1 and 24-bit playback seems to work as
>> Ben has indicated. So I don't think it is broken.
> 
>> Can you try Ben's testcase on Tegra30 (ie. generate a tone using sox and
>> use aplay to play)?
> 
> Another test application that's quite useful for this sort of stuff is
> speaker-test, it generates audio data directly in arbatrary formats and
> it's part of alsa-utils so if you've got aplay and friends you may
> already have it already installed.

I tried speaker-test and it doesn't support S24_LE:

# speaker-test -h

speaker-test 1.1.9

Usage: speaker-test [OPTION]...
-h,--help       help
-D,--device     playback device
-r,--rate       stream rate in Hz
-c,--channels   count of channels in stream
-f,--frequency  sine wave frequency in Hz
-F,--format     sample format
-b,--buffer     ring buffer size in us
-p,--period     period size in us
-P,--nperiods   number of periods
-t,--test       pink=use pink noise, sine=use sine wave, wav=WAV file
-l,--nloops     specify number of loops to test, 0 = infinite
-s,--speaker    single speaker test. Values 1=Left, 2=right, etc
-w,--wavfile    Use the given WAV file as a test sound
-W,--wavdir     Specify the directory containing WAV files
-m,--chmap      Specify the channel map to override
-X,--force-frequency    force frequencies outside the 30-8000hz range
-S,--scale      Scale of generated test tones in percent (default=80)

Recognized sample formats are: S8 S16_LE S16_BE FLOAT_LE S24_3LE S24_3BE
S32_LE S32_BE
