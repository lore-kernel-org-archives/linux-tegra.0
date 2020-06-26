From: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] PCI: tegra: Revert raw_violation_fixup for tegra124
Date: Fri, 26 Jun 2020 15:22:47 +0200
Message-ID: <CABr+WT=Gy6vmB-GdCeR_q8ogB4b19LDqQV5mjNh5VvZ0BUJKig@mail.gmail.com>
References: <20200420164304.28810-1-kwizart@gmail.com> <680b456a-b1ed-45f6-aa38-6ec49783af6d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <680b456a-b1ed-45f6-aa38-6ec49783af6d-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Le lun. 20 avr. 2020 =C3=A0 20:16, Manikanta Maddireddy
<mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> a =C3=A9crit :
>
> Thank you Nicolas for identifying the patch which caused the CmpltTO.
>
> Little background on the fixup,
>  In the internal testing with dGPU on Tegra124, CmplTO is reported by
> dGPU. This happened because FIFO queue in AFI(AXI to PCIe) module
> get full by upstream posted writes. Back to back upstream writes
> interleaved with infrequent reads, triggers RAW violation and CmpltTO.
> This is fixed by reducing the posted write credits and by changing
> updateFC timer frequency. These settings are fixed after stress test.
>
> In the current case, RTL NIC is also reporting CmplTO. These settings
> seems to be aggravating the issue instead of fixing it.

Seems I've lost track of this  issue.

@Manikanta Maddireddy  Do you plan to have some time to work on this ?

If going with the revert I wonder if I need to revert more completely
the original patch ? Since only tegra124 used the raw_violation_fixup,
should I remove this case and the related function completely or leave
the code as is ? (there will be few unused functions maybe). Given
other fixup have been added at a later time, the full revert is less
trivial.

Right now this partial revert is enough to work reliably with the device.

Thanks for your advice.
I will send a non-RFC version then.
