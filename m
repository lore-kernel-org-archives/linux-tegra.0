From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Date: Mon, 24 Feb 2020 17:59:33 +0530
Message-ID: <f70c7c12-dbc0-a725-f06a-86fab868e7dc@nvidia.com>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
 <20200221130005.GD5546@sirena.org.uk>
 <316ce0d5-318d-0533-ef06-bd7e8672f893@nvidia.com>
 <20200221165535.GG5546@sirena.org.uk>
 <47f94534-e997-d56c-5793-ae832fb2add4@nvidia.com>
 <20200224114406.GB6215@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200224114406.GB6215-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2/24/2020 5:14 PM, Mark Brown wrote:
> On Mon, Feb 24, 2020 at 11:28:57AM +0000, Jon Hunter wrote:
>> On 21/02/2020 16:55, Mark Brown wrote:
>>> The ideal thing in a component model would be to represent those sample
>>> rate convertors directly to usrspace so the routing and rewriting is
>>> explicit.
>> I assume that it would be OK for the sample rate converter itself to
>> expose mixer controls to configure its input and output rates so the
>> user could configure as needed?
> I don't think so, I'd not expect the individual drivers to be doing
> anything user visible here - if we know what a digital transformation
> looks like the framework should be offering anything that's needed to
> users (and hiding controls that don't have any practical control in a
> given system).

Are you suggesting to have some alternate way of users configuring 
sample rates (and other params) and not use mixer control method?

This is a typical use case we see,
- [stream-1] Lets say high resolution audio is playing (96kHz, 24-bit, 
stereo)
- [stream-2] Randomly system notifications of small durations come 
(48kHz, 16-bit, stereo)
The requirement is, both streams should be mixed and played.

Tegra Audio HW has Mixer module for mixing multiple streams. In above 
case, stream-2 requires upsampling to 96kHz (employ SRC) and 24-bit. 
Then mix with stream1 and play. This needs to be configured at runtime. 
In another session, mixing for 192kHz and 48kHz might be required with 
the same audio path. Idea was to allow users to setup their custom path 
for specific audio applications. In the current series, I am focussing 
on I/O modules (where overrides do not demonstrate the above use case) 
and does not include other HW accelerators that Tegra Audio HW offers. 
Things would be more complicated when user wants to use multiplexers and 
demultiplexers. For simple use cases overrides are not used.

Is there a better way for user to configure custom audio paths?

>
>>> Is there any *need* for these to be user configurable?  What's normally
>>> happening at the minute is that either the external DAIs are fixed
>>> configuration and the DSP just converts everything or there's no format
>>> conversion done and things get passed through.
>> I can see that in most cases there are a finite set of configurations
>> that the end user may use. However, we would like to make the
>> configuration flexible as possible and this also allow us to test lots
>> of different configurations for verification purposes as well.
> Internal testing often requires things that can't be exposed to users,
> the extreme examples are things like battery chargers with health and
> safety issues if the full range of control is available.
