From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: soc-core: Fix probe deferral following prelink
 failure
Date: Tue, 2 Apr 2019 10:30:34 +0100
Message-ID: <10d454a4-e1e1-3a4b-8400-acd680d75a3d@nvidia.com>
References: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
 <4eb94b41-7e16-7b39-5c14-a7d180ce67df@nvidia.com>
 <20190402043509.GQ2059@sirena.org.uk>
 <2d8a0569-b821-c0c0-af39-d3863d17f47f@nvidia.com>
 <20190402091955.GE2059@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402091955.GE2059@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@google.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 02/04/2019 10:19, Mark Brown wrote:
> On Tue, Apr 02, 2019 at 09:52:15AM +0100, Jon Hunter wrote:
>> On 02/04/2019 05:35, Mark Brown wrote:
> 
>>> I don't have this patch at all AFAICT.
> 
>> That's odd. It is definitely in -next and I did receive an 'applied'
>> email from you [0]. So looks like something went wrong here. Can we get
>> this into v5.1?
> 
> Oh, if I've applied that's why I don't have it any more.  Indeed it's
> applied in my 5.1 branch so I don't know what you're expecting here?

Well I still don't see it in the mainline branch and some boards are
still failing to register soundcards with v5.1-rc3 because this is
missing. So I am wondering what has happened to the change. It seems it
has been dropped.

Cheers
Jon

-- 
nvpublic
