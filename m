From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Date: Mon, 22 Jun 2020 10:44:02 -0400
Message-ID: <20200622144402.GH1931@sasha-vm>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
 <20200618143046.GT1931@sasha-vm>
 <20200618143930.GI5789@sirena.org.uk>
 <20200621233352.GA1931@sasha-vm>
 <20200622112321.GB4560@sirena.org.uk>
 <20200622123118.GF1931@sasha-vm>
 <20200622132757.GG4560@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200622132757.GG4560@sirena.org.uk>
Sender: stable-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 22, 2020 at 02:27:57PM +0100, Mark Brown wrote:
>On Mon, Jun 22, 2020 at 08:31:18AM -0400, Sasha Levin wrote:
>> On Mon, Jun 22, 2020 at 12:23:21PM +0100, Mark Brown wrote:
>
>> > That's concerning - please don't do this.  It's not what stable is
>> > expected to be and there's no guarantee that you're getting all the
>> > changes required to actually make things work.
>
>> How come? This is one of the things stable rules explicitly call for:
>> "New device IDs and quirks are also accepted".
>
>I would expect that to be data only additions, I would not expect that
>to be adding new code.

These come hand in hand. Take a look at the more complex cases such as
sound/pci/hda/patch_*

>> If we're missing anything, the solution is to make sure we stop missing
>> it rather than not take anything to begin with :)
>
>It would be much better to not have to watch stable constantly like we
>currently do - we're seeing people report breakage often enough to be a
>concern as things are, we don't need to be trying to pile extra stuff in
>there because there's some keywords in a changelog or whatever.  The
>testing coverage for drivers is weak, increasing the change rate puts
>more stress on that.

Shouldn't we instead improve testing here? nvidia for example already
provides Tegra testing for stable releases, if the coverage isn't
sufficient then let's work on making it better.

-- 
Thanks,
Sasha
