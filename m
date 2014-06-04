From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Wed, 04 Jun 2014 11:13:31 -0600
Message-ID: <538F53BB.7060903@wwwdotorg.org>
References: <CAEUnVG7+=1ko8NL1Z3ovSpGveUADUidy4sBhU_dTUe1zbe-bMA@mail.gmail.com> <537BCF39.6050909@wwwdotorg.org> <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ@mail.gmail.com> <20140521205538.GA6237@mithrandir> <CAEUnVG7tDjw_6wHc=FN0KsOKsSS1u8H8SzYdxt9VCwUsARRTeQ@mail.gmail.com> <20140522094958.GA11585@ulmo> <CAEUnVG5pNMzDoXGso+UiAWPpD0hNPhBPyGr8KfV587AuU70QPQ@mail.gmail.com> <537E39D9.2000304@wwwdotorg.org> <CAEUnVG4UettOj0xDy+f6qEhUbhNs=u-wgyCf_Prsd2JpnmFfLw@mail.gmail.com> <CAEUnVG42Fmn4QOu-jObpoyViscmfKn35oDmb=WR8t=X7YVSB=Q@mail.gmail.com> <537F9BEB.5020102@wwwdotorg.org> <CAEUnVG63BCgpGuo+qcYkvpnVSSguBy9xwSC_AoZqCt1RgBqm7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEUnVG63BCgpGuo+qcYkvpnVSSguBy9xwSC_AoZqCt1RgBqm7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/23/2014 02:34 PM, Dylan Reid wrote:
...
> I also ran the HDMI audio compliance test suite.  It failed the ACR
> (clock regeneration packet) test and the audio packet timing jitter
> test, I could see that upsetting some monitors.  It looks like ACR
> packets are generated for 44.1 even when playing 48k.

That's because the only thing that sets hdmi->audio_freq is
tegra_hdmi_probe(). There needs to be a callback from the sound/HDA
driver to the display driver telling it what audio frequency is in use.
