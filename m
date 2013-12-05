From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ASoC: tegra: add tegra+MAX98090 machine driver
Date: Wed, 04 Dec 2013 17:07:19 -0700
Message-ID: <529FC3B7.5050102@wwwdotorg.org>
References: <1386195567-24124-1-git-send-email-swarren@wwwdotorg.org> <1386195567-24124-2-git-send-email-swarren@wwwdotorg.org> <20131205000059.GG29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131205000059.GG29268-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/04/2013 05:00 PM, Mark Brown wrote:
> On Wed, Dec 04, 2013 at 03:19:27PM -0700, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> Initially, this binding and driver only describe/support playback
>> to headphones and speakers, and capture from the external
>> microphone, with GPIO-based jack detection for the headphone jack
>> only.
> 
> Looks good.  I don't see patch 1, I take it that's the DT or
> something and there's no dependency for merging and I can apply?

Patch 1 is:

http://mailman.alsa-project.org/pipermail/alsa-devel/2013-December/069789.html

[PATCH 1/2] ASoC: add DT binding document for MAX98090 CODEC

It seems to have hit the mailing list archive, but I can resend if you
need.
