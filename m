From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Flash Yocto-built kernel on Tegra2 T20?
Date: Wed, 31 Oct 2012 22:47:38 -0600
Message-ID: <5091FEEA.3050905@wwwdotorg.org>
References: <CAMAb8ZNts=SB2rhD8BU+_wAQ84S3tOzwGazr5hnTveMt-BdwGA@mail.gmail.com> <CAMAb8ZN3m2Vj1o0gJaRSE5xbu2e2ih84YF_8UP1o-ztPfmj7KA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMAb8ZN3m2Vj1o0gJaRSE5xbu2e2ih84YF_8UP1o-ztPfmj7KA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Evade Flow <evadeflow-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/31/2012 04:46 PM, Evade Flow wrote:
...
> The old system's burnflash.sh script is executing the following
> commands:
...
> With the flash.sh script from NVIDIA, I'm seeing this:
...
> The differences that jump out are:
...
> 4. diffs boils down to contents of .cfg and .bct files
> 5. also pass different --odmdata args

BCT files and ODMDATA are board-specific. You should certainly use the
values from the script that's specific to your board.

Apart from that, all I can really suggest is to get the flashing process
working with the exact kernel source for the kernel binary you have that
already works. Then, once you've worked out those kinks, you could try
using a different kernel source base.

BTW, I have no idea if the L4T kernel you're trying to use has support
for p852; did you check or explicitly add it? It doesn't seem that
surprising it won't work, since the the L4T kernel is likely separate
from any kernel used by the embedded/automotive team.

My suggestion would be to try to get mainline U-Boot and Linux working
instead. You would need board schematics for that (or a working kernel
as a reference). If you have some specific need to run the downstream
L4T kernel instead, it'd be best to talk to your support contacts at NVIDIA.
