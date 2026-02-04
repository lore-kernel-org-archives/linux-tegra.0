Received: from mail.venturex.pl (mail.venturex.pl [141.95.86.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6077393DFE
	for <linux-tegra@vger.kernel.org>; Wed,  4 Feb 2026 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.86.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193931; cv=none; b=jFvvpfXU2dfe9L+zscOUWqLeq8idoglH+67ufmyfmKK7exLlfyh/4J8RDYAXiCgBa5VM+SnrA4SwGKCnKjt922z18v3EBvEAbn31vLq3QjB2XauWgYsDLM5Oh/I2z4WI81CbKDd7jX+3TN4MLrAB+9zde+STd61nUuOYoI3pOs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193931; c=relaxed/simple;
	bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=H8D5Im9bBY2fWWnJScnD7qY6KsvTAWz1l4I58r6Uryj34WfsltUmgbd0OJD1rQlpsuXpweGvjL4G4H2gxjt3Pb+oz5kZjBkc7X68lf1O++P3XfIg5iEAX/xjNlOjB7Ma+tCeyqaCCZpkojvXAkfcIttcp2LiaQ/Fk6Q6V3Jw4dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=venturex.pl; spf=pass smtp.mailfrom=venturex.pl; dkim=pass (2048-bit key) header.d=venturex.pl header.i=@venturex.pl header.b=UMdiXIdb; arc=none smtp.client-ip=141.95.86.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=venturex.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=venturex.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=venturex.pl header.i=@venturex.pl header.b="UMdiXIdb"
Received: by mail.venturex.pl (Postfix, from userid 1002)
	id 48F99201D4; Wed,  4 Feb 2026 09:31:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturex.pl; s=mail;
	t=1770193929; bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Date:From:To:Subject:From;
	b=UMdiXIdbbZCjF3XiEvYN9Zx4ZcD8R+TOQJ5UIF+Kaon0kz/c7ZNv4EKwjLHF7kvgn
	 N0Vkg22CBZ8toy6ljNQxk3t9qDNY/a07h6WTz1/h192rD4OyWsK/P7uhOXHqyn9erD
	 df8oeYkY0uC6LRVxNltyebnzF2kcDPsrjSSj+CQ3RPVJwg9Ms/VpOjTnCWm+E+J0C+
	 F419hWjVbHmelrXMaXr/U2Xz/kM2Q8PgT1+BXYk5udGlijTwS0VfALmmXtTmmmxLZ+
	 VydkNw0Lq2u2LFG7+85ksAQL3EKCJV0Z/hWW/fwTV9HToI4mkOcA2B8HtvZCfc0Jb7
	 wHhOXXa+9MEjg==
Received: by mail.venturex.pl for <linux-tegra@vger.kernel.org>; Wed,  4 Feb 2026 08:30:38 GMT
Message-ID: <20260204084500-0.1.ch.2isne.0.9h8pq5pwqq@venturex.pl>
Date: Wed,  4 Feb 2026 08:30:38 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rak"?= <mikolaj.rak@venturex.pl>
To: <linux-tegra@vger.kernel.org>
Subject: Fundacja Rodzina a optymalizacja podatkowa 
X-Mailer: mail.venturex.pl
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Szanowni Pa=C5=84stwo,

czy byliby Pa=C5=84stwo zainteresowani rozmow=C4=85 o mo=C5=BCliwych rozw=
i=C4=85zaniach dla swojej firmy i rodziny?

Nowelizacja ustawy o Fundacjach Rodzinnych otwiera przed przedsi=C4=99bio=
rcami zupe=C5=82nie nowe mo=C5=BCliwo=C5=9Bci ochrony maj=C4=85tku i plan=
owania sukcesji. Fundacja Rodzinna pozwala oddzieli=C4=87 aktywa od ryzyk=
 biznesowych, prawnych i podatkowych, a jednocze=C5=9Bnie zachowa=C4=87 k=
ontrol=C4=99 nad swoim maj=C4=85tkiem i zadba=C4=87 o jego trwa=C5=82o=C5=
=9B=C4=87 dla kolejnych pokole=C5=84.

Co istotne, po up=C5=82ywie 10 lat od wniesienia aktyw=C3=B3w do fundacji=
, roszczenia o zachowek przestaj=C4=85 obowi=C4=85zywa=C4=87. Ustawodawca=
 przewidzia=C5=82 r=C3=B3wnie=C5=BC liczne zwolnienia podatkowe obejmuj=C4=
=85ce m.in. dochody z dzia=C5=82alno=C5=9Bci gospodarczej czy wynajem nie=
ruchomo=C5=9Bci.

B=C4=99d=C4=99 wdzi=C4=99czny za informacj=C4=99, czy chcieliby Pa=C5=84s=
two pozna=C4=87 mo=C5=BCliwo=C5=9B=C4=87 stworzenia Fundacji Rodzinnej?


Pozdrawiam
Miko=C5=82aj Rak
