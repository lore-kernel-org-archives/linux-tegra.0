From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] regulator: Fix deadlock during regulator registration
Date: Wed, 30 Mar 2016 19:38:29 -0400
Message-ID: <56FC6375.4060607@osg.samsung.com>
References: <1459354153-6352-1-git-send-email-jonathanh@nvidia.com>
 <56FC607D.3020108@osg.samsung.com> <20160330233427.GZ2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160330233427.GZ2350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Mark,

On 03/30/2016 07:34 PM, Mark Brown wrote:
> On Wed, Mar 30, 2016 at 07:25:49PM -0400, Javier Martinez Canillas wrote:
> 
>> You are doing some cleanup of the clean and scrub error paths by removing
>> rdev and returning ERR_PTR(ret) directly. I believe that should be in a
>> separate patch since is not related to the fix.
> 
> There needs to be some reorganization due to the movement with the mutex
> handling.
> 

Yes, I know. My point was that besides the reorganization that is needed,
he is removing some variables and that seemed like a separate change to me.

But of course you are the maintainer so ignore my comment if you don't mind
about that.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
