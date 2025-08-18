Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3353451A9;
	Mon, 18 Aug 2025 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755546798; cv=none; b=YI0p2unF8nmFTLHeXZxVrBRZeUEFvpH+bbtYCzR6VX5UKiEbVsYvN80VLU6UUc2+TC7R0/LkQ/JbA9HVdoVUXwN/22reXQQlPuWu2d7/jzwPPWoyhBxS2z2Me9RMYA36I8nU6zL+fxfMwZza0oTOzDWyNndL2UXWpCIin+VRzb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755546798; c=relaxed/simple;
	bh=LH0EOAloHY+TBXO5ZIVuNQjI4NF4jj37/tc2rIx+kSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hC52r/0mMfLwdMwAMgr/Sn+YpY6XsuqGMIlKhoTnp3wAF/srTDlLebXEoarh8BLwMhJE+5HNBe8gFVYEwaA1LFdSwr7/yhV3VDO1gYXUtkbgD1mobFlvotxvVU5yChRT/EDKNgKIEqTGYzX6WB8c+/FYF782UVjylVU/fT9iGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ep+/jGWT; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ep+/jGWT"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-323266cdf64so3521792a91.0;
        Mon, 18 Aug 2025 12:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755546796; x=1756151596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddujuKZzdznsNRHmWIL8Rav8U13raNV9R5xEbx1RJto=;
        b=Ep+/jGWTxCFpFCDF0Z8FPM1xRMXtZXIK7I4qDXDaeHBE7AbDUwE8Zl7g7dwNBIKfo+
         4aHT+RVW1YkoA6wK97y3QB6msbt/N6WemovtTnh6CMufE19qAAQwKJOl7dkyUkzBTQO/
         sdnQB8p+4DWqRXbQx0poz7oZAe0FrQkG4sBhMOTbZxxutxr9/C9xADT3stvNrX5Sk6q1
         pBzxg9mFpFDO76avvFcc5kO4GdVMXyN+AEY7lEvlbaR4vVTUlgfDcHb1eP1dtROQLGAW
         KtYFUOkf5nvEsF+SBOlFLS4JAE07G+TJQUTclJJlJh7xrPEoGSIZ5brNxs8f+fNfzpIx
         JztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755546796; x=1756151596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddujuKZzdznsNRHmWIL8Rav8U13raNV9R5xEbx1RJto=;
        b=QUpO3Tj2jlEStQHzPRxwhNkjQaD+3p054cpgozvQkKYGHthKLjrDYpkqS+mDYU8Gvo
         D8/AE4TPcwZzIjAvzU7RwnB9VxDh+h+FXkX3GAXOgLvgCErHN3VT2RcYHg8nQ5Dw9L8a
         bW/A9rQH3oE642IMsD3aRX6ENYlTHYKvPusiaSHD+YJM4LjBshiLMf8oDIIkOpm1TedV
         /pt6WFJbpq3hnZdDS1Vn650Pk5ADaujb5oJ+EL93BK/xGY6gczY3BpJXAJG46VpdK8AB
         6geTIJIFF5kTexnZ58TRnWSgmzmutnEG0wj6IXMTvGGr1bLZyafZSlO3muAMgipjRvZr
         oJXg==
X-Forwarded-Encrypted: i=1; AJvYcCUDx0U+hz59LykkNYdYQ8aySesVsOhH/4AF7P3qH2gX3sSGvDYdXnj1oY9vAAik5DVZLsTfMNNQ+YytuQM=@vger.kernel.org, AJvYcCUM0zRCeOwaZB3MLuURuTPNAmS730BIW/v1IHM2P3fbCnA2uu9U/U2JHOewQxTduDxjW4aT+eHPhGdMFTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhDb1IMgO2vPHe+DJgazVs7UNl0qzCw2a1cS9IJAE9eHH8K65
	7PCg56rrsBRGZ/DljNUK/uuRa2awLGF8vYY813ySrjsjsuLu/+JmhruNRMPeiLKSmeXcWfg4skb
	gRCPyqwSQ0RqTVmuR1fa0bxoxW3YCN/ttb02piUbZ2/E9cqI=
X-Gm-Gg: ASbGncuGbm+6Jt7x2AeC+rJKAAink6JOrRpkM1XTCDt+6oN3cY/enkMTGRXkjHij8ya
	Q/7OFOFRUdOC6/WZflCwpnhvbpElFdG0fyRY+wR7AoA04FRMFPDRY/3kFpOdrsEzrgzYDQl1AsH
	Lsw2VCl2Ctkzq8oJtffHSac3fvmcxabsvJI4jqXjR7o1rqsu0NukGQ7iUjwJeqik+pFpiPrTXJS
	DbM5hcb
X-Google-Smtp-Source: AGHT+IEOXjh8m7XOu9uCTimW1hsmXKnD/yesqpDGGJb1xX58q/XN0hA0shVUPi2bcss3U64Ds2mbaAdmVSGdxcgyB20=
X-Received: by 2002:a17:90b:1f89:b0:313:dcf4:37bc with SMTP id
 98e67ed59e1d1-32476abbf1bmr125297a91.34.1755546795610; Mon, 18 Aug 2025
 12:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817192425.12983-1-mohammed.guermoud@gmail.com> <CAMuHMdXQfUCYdt-PJX8rYP3bf8Z_ea3Obgunm-_7KmJxMrU_fQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXQfUCYdt-PJX8rYP3bf8Z_ea3Obgunm-_7KmJxMrU_fQ@mail.gmail.com>
From: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Date: Mon, 18 Aug 2025 20:52:39 +0100
X-Gm-Features: Ac12FXwyElvAUJvFi82Gmun_imSpGpqzSHFgcqTf4mVT3MjvaXtgPn6FrUMByEs
Message-ID: <CA+Vbt5GwiaNaFEVa+U_dFe3jLpYAE+7PbTXC7jgOoqt1YqQo_Q@mail.gmail.com>
Subject: Re: [PATCH] staging: nvec: Silence unused argument warning in
 NVEC_PHD macro
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg, Dan, and Geert,

Thank you all for the detailed feedback. This has been a great
learning experience.

My initial patch was incorrect and broke the build, as the test robot found=
.

Following Greg's advice, I will send a v2 patch that removes the
unused NVEC_PHD macro and all the places it is used.

Thanks,
Mohammed


Mohammed GUERMOUD
Software Architect
Stellantis (Formerly Groupe PSA Peugeot Citro=C3=ABn) - Morocco


On Mon, Aug 18, 2025 at 4:42=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Mohammed,
>
> On Mon, 18 Aug 2025 at 17:10, Mohammed Guermoud
> <mohammed.guermoud@gmail.com> wrote:
> > The NVEC_PHD macro was defined with three arguments (str, buf, len)
> > that were not used in its empty body, causing a compiler warning.
> >
> > This patch silences the warning by explicitly casting the unused
> > arguments to (void), making the intent clear without changing
> > functionality.
> >
> > Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
>
> Thanks for your patch!
>
> > --- a/drivers/staging/nvec/nvec_ps2.c
> > +++ b/drivers/staging/nvec/nvec_ps2.c
> > @@ -28,7 +28,7 @@
> >         print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
> >                         16, 1, buf, len, false)
> >  #else
> > -#define NVEC_PHD(str, buf, len) do { } while (0)
> > +#define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; =
} while (0)
> >  #endif
> >
> >  enum ps2_subcmds {
>
> The proper solution would be to remove the custom NVEC_PHD() macro (and
> NVEC_PS2_DEBUG), and just call print_hex_dump_debug() directly instead.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
