From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RFC PATCH] ASoC: core: Optimise suspend/resume of DAPM widgets
Date: Thu, 16 Aug 2018 16:25:19 +0100
Message-ID: <b263b31d-6fcb-2ea6-f548-3db2b00846ab@nvidia.com>
References: <1533301025-19980-1-git-send-email-jonathanh@nvidia.com>
 <20180803163605.GD6591@sirena.org.uk>
 <7ba86328-5bb6-5280-df6f-9937173fb2ab@nvidia.com>
 <20180814144004.GD5810@sirena.org.uk>
 <e1bc40ec-de7e-2b77-d7f6-ec6b3066aeec@nvidia.com>
 <20180816105135.GZ2414@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180816105135.GZ2414@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 16/08/18 11:51, Mark Brown wrote:
> On Wed, Aug 15, 2018 at 07:48:47PM +0100, Jon Hunter wrote:
> 
>> So then I made the following change to avoid scheduling the function
>> calls unnecessarily (which I think should be fine) ...
> 
>> Please note that I am just using ktime_get() to log the time on entry
>> and exit from dapm_power_widgets() and so yes the time may not be
>> purely the time take to execute this function if we are preempted,
>> but I am measuring in the same way in both cases and so it does seem
>> to show some improvement.
> 
> That seems like a simple and useful optimization, will you send a patch?

Yes I will send a patch for this.

Cheers
Jon

-- 
nvpublic
