From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V6 07/27] PCI: tegra: Advertise PCIe Advanced Error
 Reporting (AER) capability
Date: Sun, 19 Jan 2020 15:43:49 +0530
Message-ID: <7739c4e7-d604-a23f-7469-08fbdafb8537@nvidia.com>
References: <20190618180206.4908-1-mmaddireddy@nvidia.com>
 <20190618180206.4908-8-mmaddireddy@nvidia.com>
 <CABr+WTkoj1zk6RRdPvb2wd9HgBJEbPJR=dtY4f+V1gFrEb671A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABr+WTkoj1zk6RRdPvb2wd9HgBJEbPJR=dtY4f+V1gFrEb671A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 16-Jan-20 3:43 AM, Nicolas Chauvet wrote:
> External email: Use caution opening links or attachments
>
>
> Le mar. 18 juin 2019 =C3=A0 20:02, Manikanta Maddireddy
> <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> a =C3=A9crit :
>> Default root port setting hides AER capability. This patch enables the
>> advertisement of AER capability by root port.
> Hello,
>
> For your information, I've reported an issue on kernel.org that is
> related to AER in pcie with the ethernet NIC on jetson-tk1
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206217
>
> I hope someone can shred some lights on this.
>
> --
> -
>
> Nicolas (kwizart)

Hi Nicolas,

This patch enables error reporting capability, it shouldn't have caused
"NETDEV WATCHDOG" error. Let us follow up on the issue in kernel.org.

Thanks,
Manikanta
