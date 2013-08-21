From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [GIT PULL 3/4] ARM: tegra: device tree changes for 3.12
Date: Wed, 21 Aug 2013 09:57:03 -0600
Message-ID: <5214E34F.2030606@wwwdotorg.org>
References: <1376673628-5867-1-git-send-email-swarren@wwwdotorg.org> <1376673628-5867-3-git-send-email-swarren@wwwdotorg.org> <8738q4j59d.fsf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8738q4j59d.fsf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/20/2013 05:45 PM, Kevin Hilman wrote:
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
> 
>> This branch contains all *.dts (device tree) changes for Tegra.
>> New features enabled are:
>>
>> * PMICs on Dalmore
>> * CPU power-gating on Dalmore
>> * HDMI output on Beaver
>> * LP1 system suspend mode on almost all boards
>> * PCIe support on numerous Tegra20/30 boards
>> * USB support on Tegra30/114 boards
>> * Audio capture on Beaver and Dalmore
>> * Temperature sensor on Cardhu.
>>
>> ... along with a few DT cleanups.
> 
> Hmm, shouldn't I have a DT maintainer signoff on this stuff... oh,
> wait... ;)

One thought here on my DT binding maintainer role (hence CCing the other
DT maintainers):

I assume that the DT maintainers are reviewing the DT bindings, and not
the *.dts files. There's certainly so much email defining/modifying
bindings that I can't even keep up with that. So, I deliberately don't
even attempt to look at anything other than the binding changes. Is this
not what the role entails? If the role is supposed to include reviewing
*.dts changes, then perhaps I should wait until someone else has
reviewed such patches before applying them to the Tegra tree?

Of course, as Tegra maintainer I do actively look at the specific *.dts
changes that go through my own tree.
