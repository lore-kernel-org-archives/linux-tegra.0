From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Linux 3.4-rc1
Date: Tue, 3 Apr 2012 08:29:54 +0200
Message-ID: <20120403.092954.1292069011296905405.hdoyu@nvidia.com>
References: <CA+55aFy4aFGRLUrF+rYN3dskTepBtC+=x3B3bc_rzf1OaN_5pw@mail.gmail.com><CAH9JG2Wha0+6BwGW0APtEX2KACyR1+9fdKpJkM+iOU1m8N6d4w@mail.gmail.com><CA+55aFw1ZG9R2MzgXmi0YE64t+xH95QnVuJB55sQ6xgDbnzkyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+55aFw1ZG9R2MzgXmi0YE64t+xH95QnVuJB55sQ6xgDbnzkyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

=46rom: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: Linux 3.4-rc1
Date: Tue, 3 Apr 2012 05:57:26 +0200
Message-ID:=20
 <CA+55aFw1ZG9R2MzgXmi0YE64t+xH95QnVuJB55sQ6xgDbnzkyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

> On Mon, Apr 2, 2012 at 7:57 PM, Kyungmin Park <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> =
wrote:
> > On Sun, Apr 1, 2012 at 8:58 AM, Linus Torvalds
> >>
> >> =A0- DMA-mapping framework. The tree now has a few more acks from
> >> people, and it's largely in the same situation as HSI is: I'll
> >> probably pull, but I really wanted the users who are impacted to
> >> actually talk to me about it.
> >
> > Now Marek and Nvidia persons are used it for DMA mapping based IOMM=
U.
> >
> > Are there other person who help to merge it?
> > (+CC related persons).
>=20
> I want the people who want it to contact me and talk about what they
> do with it. So far, I haven't seen anything.

Nvidia ARM SoC Tegra3 has IOMMU(SMMU), and most of its peripheral
devices can be clients of IOMMU. Their IOMMU'abiblity can be
configured. With DMA-mapping API, we wouldn't have to change any of
device driver code with\without IOMMU, but those 'dma_addr_t' could be
physical address or device virtual address trasparently.
