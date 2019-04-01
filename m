From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: soc-core: Fix probe deferral following prelink
 failure
Date: Mon, 1 Apr 2019 13:22:09 +0100
Message-ID: <4eb94b41-7e16-7b39-5c14-a7d180ce67df@nvidia.com>
References: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@google.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Mark,

On 04/03/2019 13:31, Jon Hunter wrote:
> From: Jonathan Hunter <jonathanh@nvidia.com>
> 
> Commit 78a24e10cd94 ("ASoC: soc-core: clear platform pointers on error")
> re-worked the clean-up of any platform pointers that may have been
> initialised by the function snd_soc_init_platform(). This commit missed
> one error path where if any of the prelinks for a soundcard failed to
> initialise, then these platform pointers would not be cleaned-up. This
> then prevents the soundcard from being initialised following a probe
> deferral when any of the soundcard prelinks cannot be found.
> 
> Fix this by ensuring that soc_cleanup_platform() is called when
> initialising the soundcard prelinks fails.
> 
> Fixes: 78a24e10cd94 ("ASoC: soc-core: clear platform pointers on error")
> 
> Signed-off-by: Jonathan Hunter <jonathanh@nvidia.com>

FYI, I am seeing that the deferral of soundcards failing with v5.1-rc3
because the above has not been merged yet. Just wanted to let you know
in case this one was not marked for v5.1.

Cheers
Jon

-- 
nvpublic
