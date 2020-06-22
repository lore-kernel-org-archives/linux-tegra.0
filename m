From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Date: Mon, 22 Jun 2020 08:31:18 -0400
Message-ID: <20200622123118.GF1931@sasha-vm>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
 <20200618143046.GT1931@sasha-vm>
 <20200618143930.GI5789@sirena.org.uk>
 <20200621233352.GA1931@sasha-vm>
 <20200622112321.GB4560@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200622112321.GB4560-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 22, 2020 at 12:23:21PM +0100, Mark Brown wrote:
>On Sun, Jun 21, 2020 at 07:33:52PM -0400, Sasha Levin wrote:
>> On Thu, Jun 18, 2020 at 03:39:30PM +0100, Mark Brown wrote:
>> > On Thu, Jun 18, 2020 at 10:30:46AM -0400, Sasha Levin wrote:
>> > > On Thu, Jun 18, 2020 at 12:00:23PM +0100, Mark Brown wrote:
>
>> > > > This is a new feature not a bugfix.
>
>> > > I saw this patch more as a hardware quirk.
>
>> > Pretty much any DT property is a hardware quirk :(
>
>> Which is why we're taking most of them :)
>
>That's concerning - please don't do this.  It's not what stable is
>expected to be and there's no guarantee that you're getting all the
>changes required to actually make things work.

How come? This is one of the things stable rules explicitly call for:
"New device IDs and quirks are also accepted".

If we're missing anything, the solution is to make sure we stop missing
it rather than not take anything to begin with :)

-- 
Thanks,
Sasha
