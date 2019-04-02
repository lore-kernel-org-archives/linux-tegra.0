From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: soc-core: Fix probe deferral following prelink
 failure
Date: Tue, 2 Apr 2019 10:44:34 +0100
Message-ID: <3053ef10-ba36-ee88-4ca0-d1e39c0ea25c@nvidia.com>
References: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
 <4eb94b41-7e16-7b39-5c14-a7d180ce67df@nvidia.com>
 <20190402043509.GQ2059@sirena.org.uk>
 <2d8a0569-b821-c0c0-af39-d3863d17f47f@nvidia.com>
 <20190402091955.GE2059@sirena.org.uk>
 <10d454a4-e1e1-3a4b-8400-acd680d75a3d@nvidia.com>
 <20190402093159.GF2059@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402093159.GF2059@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@google.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 02/04/2019 10:31, Mark Brown wrote:
> On Tue, Apr 02, 2019 at 10:30:34AM +0100, Jon Hunter wrote:
>> On 02/04/2019 10:19, Mark Brown wrote:
> 
>>> Oh, if I've applied that's why I don't have it any more.  Indeed it's
>>> applied in my 5.1 branch so I don't know what you're expecting here?
> 
>> Well I still don't see it in the mainline branch and some boards are
>> still failing to register soundcards with v5.1-rc3 because this is
>> missing. So I am wondering what has happened to the change. It seems it
>> has been dropped.
> 
> You can check to see what's in my tree by looking at it directly or at
> -next.

Right I see it in -next. Sorry but what I am asking is if you are
planning to send as a fix for v5.1? Maybe you have not sent out the
fixes yet for v5.1 and so wanted to check.

Cheers
Jon

-- 
nvpublic
