Received: from mail.taskera.pl (mail.taskera.pl [51.75.73.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C202B2F363B
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 08:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.75.73.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120408; cv=none; b=HTXhnAtU/uDMhibKmFRCyuveecfr3a5MomO35Y/HdZIvJ6fsS87xzUx0zKdpLtgycFi7S/1Kv30/olmL2G+nsJILM10tSDT3VbycPn7hfZoVSQ3VpWQbaYLTa4s5vP96YPrRRPizqStUrWzY5WO2qII5QFUq6O3ADBvolZlSX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120408; c=relaxed/simple;
	bh=LHmroAf0IX0JOjVUiIwqM4s8ghVxxktECxT6AQD+q2c=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=QjFvoM7kqU63ixiwbEq1YATebRTrGV3NYbZDcEJh4Dn07C0eCTo2sTGzi5X//tvwpX2cAYM+dhGP8Ez4xAh1TndL3ozlCpoHZujCg4PiZRqZPJbU/KnvINtIdo3HR3oBY2L9bnf44oixC0AUyEyKW1/+ezCQCTU65wDAZNGnbAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=taskera.pl; spf=pass smtp.mailfrom=taskera.pl; dkim=pass (2048-bit key) header.d=taskera.pl header.i=@taskera.pl header.b=aqYNQ+1e; arc=none smtp.client-ip=51.75.73.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=taskera.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=taskera.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=taskera.pl header.i=@taskera.pl header.b="aqYNQ+1e"
Received: by mail.taskera.pl (Postfix, from userid 1002)
	id 3E5F425A90; Wed, 22 Oct 2025 10:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskera.pl; s=mail;
	t=1761120405; bh=LHmroAf0IX0JOjVUiIwqM4s8ghVxxktECxT6AQD+q2c=;
	h=Date:From:To:Subject:From;
	b=aqYNQ+1ebzXZqvwNtj5069ohoD+IXjUQOej8+rc+3aSwySblLyhA9bqNL9u0rOeUn
	 IJi7QMfGxKFGd0A2QpvwKnH/P7IXzm0JRfP0X4klsJEG8iRxbGidUolvzeWo54N/Wr
	 27wS1RiydCJOxd/7S+OA3YTQveUH/ALw0Kx+SUIzNsB3bkyy26M5+K9hNnWjB0mUiM
	 0tK/NkVUq/vkVQ+Oan5QlWfTIIHWapBetKNdk6XhXj2G6KRpexvBtl+CwwC81nBLQ/
	 ewilzxQ8tXzZ5jhAc1/HhU+N+TjkO5X3YiVFG8obUeU6OqRtEosirk/FYwy/MyJpLa
	 VN0eVNE1VDMFQ==
Received: by mail.taskera.pl for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 08:05:57 GMT
Message-ID: <20251022084500-0.1.e0.vuvt.0.3qhwi6oeqr@taskera.pl>
Date: Wed, 22 Oct 2025 08:05:57 GMT
From: "Eryk Wawrzyn" <eryk.wawrzyn@taskera.pl>
To: <linux-tegra@vger.kernel.org>
Subject: Zwrot
X-Mailer: mail.taskera.pl
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dzie=C5=84 dobry,

kontaktuj=C4=99 si=C4=99 w imieniu kancelarii specjalizuj=C4=85cej si=C4=99=
 w zarz=C4=85dzaniu wierzytelno=C5=9Bciami.

Od lat wspieramy firmy w odzyskiwaniu nale=C5=BCno=C5=9Bci. Prowadzimy ko=
mpleksow=C4=85 obs=C5=82ug=C4=99 na etapach: przeds=C4=85dowym, s=C4=85do=
wym i egzekucyjnym, dostosowuj=C4=85c dzia=C5=82ania do bran=C5=BCy Klien=
ta.

Kiedy mo=C5=BCemy porozmawia=C4=87?


Pozdrawiam
Eryk Wawrzyn
