From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Question: DTS and redundant board IDs
Date: Thu, 03 May 2012 09:37:51 -0600
Message-ID: <4FA2A64F.7040101@wwwdotorg.org>
References: <2933195.fDVRYZOqQe@kira>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2933195.fDVRYZOqQe@kira>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Lanzend=F6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/03/2012 08:50 AM, David Lanzend=F6rfer wrote:
> Hello
> As you certainly already have heard some manufacturers are using the =
same
> board ID for multiple devices.
> For instance, the NotionInk Adam registers as harmony board,
> while it's pinmuxing differs in fact a lot.
> My question:
> How could this be handled by DTS?

The machine ID isn't relevant with device tree; just supply the correct
content in device tree and it'll work out fine.
