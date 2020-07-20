From: Nicolas Chauvet <kwizart@gmail.com>
Subject: Re: [PATCH] pci: tegra: Revert raw_violation_fixup for tegra124
Date: Mon, 20 Jul 2020 09:02:59 +0200
Message-ID: <CABr+WTkJ8jZDkM_=-LYxpbrqrsPEb96YBRJvBjR5u+0Ck9R4CQ@mail.gmail.com>
References: <20200717213510.171726-1-kwizart@gmail.com> <20200717215304.GA775582@bjorn-Precision-5520>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200717215304.GA775582@bjorn-Precision-5520>
Sender: stable-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Le ven. 17 juil. 2020 =C3=A0 23:53, Bjorn Helgaas <helgaas@kernel.org> a =
=C3=A9crit :
>
Thanks for the quick review. I've addressed all comments and I've
resubmitted a v2 to
https://www.spinics.net/lists/linux-pci/msg96863.html
Unfortunately I've missed to modify the [Patch v2] tag. I hope this is
fine. Let me know if I need to resend.

> Is v5.4.x really the oldest kernel that should get this fix?  It looks
> like 191cd6fb5d2c appeared in v5.3.
The commit was introduced in 5.3 indeed. I've added 5.4.x since it's
the last maintained kernel from long term branches.
Now I'm using the Fixes: tag, I've dropped the version of the kernel
for stable as it seems duplicate and less accurate.

Thanks.
