From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Date: Thu, 18 Jun 2020 10:30:46 -0400
Message-ID: <20200618143046.GT1931@sasha-vm>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200618110023.GB5789-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 18, 2020 at 12:00:23PM +0100, Mark Brown wrote:
>On Wed, Jun 17, 2020 at 09:01:41PM -0400, Sasha Levin wrote:
>> From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> [ Upstream commit 3ef9d5073b552d56bd6daf2af1e89b7e8d4df183 ]
>>
>> The microphone-jack state needs to be masked in a case of a 4-pin jack
>> when microphone and ground pins are shorted. Presence of nvidia,headset
>> tells that WM8903 CODEC driver should mask microphone's status if short
>> circuit is detected, i.e headphones are inserted.
>
>This is a new feature not a bugfix.

I saw this patch more as a hardware quirk.

-- 
Thanks,
Sasha
