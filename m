From: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V6 07/27] PCI: tegra: Advertise PCIe Advanced Error
 Reporting (AER) capability
Date: Wed, 15 Jan 2020 23:13:34 +0100
Message-ID: <CABr+WTkoj1zk6RRdPvb2wd9HgBJEbPJR=dtY4f+V1gFrEb671A@mail.gmail.com>
References: <20190618180206.4908-1-mmaddireddy@nvidia.com> <20190618180206.4908-8-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20190618180206.4908-8-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Le mar. 18 juin 2019 =C3=A0 20:02, Manikanta Maddireddy
<mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> a =C3=A9crit :
>
> Default root port setting hides AER capability. This patch enables the
> advertisement of AER capability by root port.

Hello,

For your information, I've reported an issue on kernel.org that is
related to AER in pcie with the ethernet NIC on jetson-tk1
https://bugzilla.kernel.org/show_bug.cgi?id=3D206217

I hope someone can shred some lights on this.

--=20
-

Nicolas (kwizart)
