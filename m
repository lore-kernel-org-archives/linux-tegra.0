From: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] gpu: drm: tegra: Adjust dsi phy timing
Date: Wed, 3 Dec 2014 01:32:13 +0000
Message-ID: <933ffb723a844e9d90e89327d56130fd@HQMAIL102.nvidia.com>
References: <1417481522-32110-1-git-send-email-davidu@nvidia.com>
 <20141202093712.GB6135@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141202093712.GB6135@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Thierry Reding' <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'airlied-cv59FeDIM0c@public.gmane.org'" <airlied-cv59FeDIM0c@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "'swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org'" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "'gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org'" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


> Please use the scripts/get_maintainer.pl script to find the correct list
> of recipients.

ccing airlied-cv59FeDIM0c@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org and gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


> > Fixing DSI phy setting of HS trail timings.
> 
> You're going to have to explain /why/ you're making this change and
> describe what exactly this fixes. DSI works fine on any of the boards
> that I have, so I'm surprised that this would need "fixing".

It is found by hardware that after HS data burst, the HS trail is off by -12% during compliance testing.

> Also: "phy" -> "PHY".

I'll adjust comment.


> My recollection is that I took these timing values straight from the
> D-PHY specification, so you're going to have to explain why this is
> necessary and where you took this from.

There is set of timings recommendations in the tegra dsi programming guide.
The D-PHY spec is the minimal setting, but the SOC may need other adjustments.

David
