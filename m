From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: soc-core: Fix probe deferral following prelink
 failure
Date: Tue, 2 Apr 2019 09:52:15 +0100
Message-ID: <2d8a0569-b821-c0c0-af39-d3863d17f47f@nvidia.com>
References: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
 <4eb94b41-7e16-7b39-5c14-a7d180ce67df@nvidia.com>
 <20190402043509.GQ2059@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402043509.GQ2059@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@google.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 02/04/2019 05:35, Mark Brown wrote:
> On Mon, Apr 01, 2019 at 01:22:09PM +0100, Jon Hunter wrote:
> 
>> FYI, I am seeing that the deferral of soundcards failing with v5.1-rc3
>> because the above has not been merged yet. Just wanted to let you know
>> in case this one was not marked for v5.1.
> 
> I don't have this patch at all AFAICT.

That's odd. It is definitely in -next and I did receive an 'applied'
email from you [0]. So looks like something went wrong here. Can we get
this into v5.1?

Cheers
Jon

[0] https://lkml.org/lkml/2019/3/4/637


-- 
nvpublic
