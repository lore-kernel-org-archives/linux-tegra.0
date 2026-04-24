Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A2F3A6B92;
	Fri, 24 Apr 2026 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777044825; cv=none; b=E1IaFm8pHx3sdDHibxyTXMawOvSet4A58zH/caCQoDNDos2i5KPOz3jF9Me3SJ7jH296AMYJLWAhsBNfCqDBqUMShtwPG59hnQP083NbaTU+hju+IaUh7bViWQulsY921TIBMXRC7pLcAmZ+lYK+zH2DcPYRj/Zbod5ZsHkq5V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777044825; c=relaxed/simple;
	bh=PlKmT+kLjpcPtMfqCNu/qukSxWgKZX0kjiZgkAI2D9c=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=aphlk7wZPFwjZFCQT22BTEbRQLk7Y59J4GRJWsYeJa14uDeh1IW5rpihTiuqv40Jiwa7QH4cQwG1k65hdlswIm3YkYxO4JSBOT4oN/iE+k45GGlk8v1PBT83dDMpMnsvLQaBtc31jW1Feb3M4Nur+/HYjJYFWc1MlQxrNZc5TP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NC93A34s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NC93A34s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1154C19425;
	Fri, 24 Apr 2026 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777044824;
	bh=PlKmT+kLjpcPtMfqCNu/qukSxWgKZX0kjiZgkAI2D9c=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=NC93A34sB1ECfO39DSMdXI3/+42Rf98ePf43mqSSByZaRdM+TzxHGZicdgW3w/ECj
	 UsRNjirWMqwcF+sQQ+haWl+FBnl9be/OX/hr+0BfMzepxXGiCXBiJNABaM10E2iOER
	 pyh+Mb3MntIikRejCEbPNCMjolzzj9sv74iIkmT5Gh6xw5UloQaL9aJAVAw8nsCPx5
	 82EBpgaZH7K4HWZY8xqhWT5hmIUg1vj35xdnIBJMO7RM419WtjwYra717XdI34bcTK
	 VDkB3NG1uC4mBn/ThgYqbMisvGBmwvo3BM1oRWBdIIQuFid9pk3jjgA6V3AK0QlMpl
	 swVv3wO1l8/ew==
Date: Fri, 24 Apr 2026 08:33:41 -0700
From: Kees Cook <kees@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_pstore/zone=3A_Emit_regist?=
 =?US-ASCII?Q?ration_message_as_a_single_pr=5Finfo=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260424095820.1433700-1-kkartik@nvidia.com>
References: <20260424095820.1433700-1-kkartik@nvidia.com>
Message-ID: <273C4CEB-8FC5-4420-BC74-691A58E254F2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 24, 2026 2:58:20 AM PDT, Kartik Rajput <kkartik@nvidia=2Ecom> wro=
te:
>register_pstore_zone() prints its "registered =2E=2E=2E as backend for =
=2E=2E=2E"
>summary as a pr_info() followed by several pr_cont() calls=2E
>
>pr_cont() is not atomic and has no log level of its own=2E It appends
>to whichever line was most recently opened by a printk()=2E If a
>pr_err() or pr_warn() from another CPU or an interrupt handler
>preempts the pr_info() / pr_cont() sequence, it closes the
>continuation between the fragments=2E This can cause parts of the
>pstore registration message to appear at the wrong log level and be
>interleaved with other messages=2E
>
>Furthermore, this causes the detection of new warning and error
>messages in the kernel log to be unreliable=2E
>
>Format the registration line in a small local buffer using
>scnprintf() and emit it with a single pr_info() call, making the
>line atomic with respect to concurrent printk() callers=2E  No
>functional change to registration=2E
>
>Signed-off-by: Kartik Rajput <kkartik@nvidia=2Ecom>
>---
> fs/pstore/zone=2Ec | 20 ++++++++++----------
> 1 file changed, 10 insertions(+), 10 deletions(-)
>
>diff --git a/fs/pstore/zone=2Ec b/fs/pstore/zone=2Ec
>index a3b003f9a3a0=2E=2Efbe0a252dd2a 100644
>--- a/fs/pstore/zone=2Ec
>+++ b/fs/pstore/zone=2Ec
>@@ -1301,6 +1301,8 @@ int register_pstore_zone(struct pstore_zone_info *i=
nfo)
> {
> 	int err =3D -EINVAL;
> 	struct psz_context *cxt =3D &pstore_zone_cxt;
>+	char buf[256] =3D "";
>+	size_t len =3D 0;

Please use a seq_buf backed by a stack array instead of the scnprintf call=
s=2E

Otherwise, yes, seems good to keep this all on one line=2E

Thanks!

-Kees

>=20
> 	if (info->total_size < 4096) {
> 		pr_warn("total_size must be >=3D 4096\n");
>@@ -1383,30 +1385,28 @@ int register_pstore_zone(struct pstore_zone_info =
*info)
> 	}
> 	cxt->pstore=2Edata =3D cxt;
>=20
>-	pr_info("registered %s as backend for", info->name);
> 	cxt->pstore=2Emax_reason =3D info->max_reason;
> 	cxt->pstore=2Ename =3D info->name;
> 	if (info->kmsg_size) {
> 		cxt->pstore=2Eflags |=3D PSTORE_FLAGS_DMESG;
>-		pr_cont(" kmsg(%s",
>-			kmsg_dump_reason_str(cxt->pstore=2Emax_reason));
>-		if (cxt->pstore_zone_info->panic_write)
>-			pr_cont(",panic_write");
>-		pr_cont(")");
>+		len +=3D scnprintf(buf + len, sizeof(buf) - len, " kmsg(%s%s)",
>+			       kmsg_dump_reason_str(cxt->pstore=2Emax_reason),
>+			       cxt->pstore_zone_info->panic_write ? ",panic_write" : "");
> 	}
> 	if (info->pmsg_size) {
> 		cxt->pstore=2Eflags |=3D PSTORE_FLAGS_PMSG;
>-		pr_cont(" pmsg");
>+		len +=3D scnprintf(buf + len, sizeof(buf) - len, " pmsg");
> 	}
> 	if (info->console_size) {
> 		cxt->pstore=2Eflags |=3D PSTORE_FLAGS_CONSOLE;
>-		pr_cont(" console");
>+		len +=3D scnprintf(buf + len, sizeof(buf) - len, " console");
> 	}
> 	if (info->ftrace_size) {
> 		cxt->pstore=2Eflags |=3D PSTORE_FLAGS_FTRACE;
>-		pr_cont(" ftrace");
>+		len +=3D scnprintf(buf + len, sizeof(buf) - len, " ftrace");
> 	}
>-	pr_cont("\n");
>+
>+	pr_info("registered %s as backend for%s\n", info->name, buf);
>=20
> 	err =3D pstore_register(&cxt->pstore);
> 	if (err) {

--=20
Kees Cook
